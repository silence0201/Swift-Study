//
//  SQLiteManger.swift
//  SQLiteDemo
//
//  Created by 杨晴贺 on 2017/3/17.
//  Copyright © 2017年 Silence. All rights reserved.
//

import UIKit
import FMDB

/// 全局访问点
class SQLiteManger {
    static let shared = SQLiteManger()
    
    /// 数据库队列
    let queue: FMDatabaseQueue
    
    private init(){
        let dbName = "status.db"
        var path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        path = (path as NSString).appendingPathComponent(dbName)
        
        print("数据库的路径"+path)
        
        // 创建数据库队列,同时创建或者打开数据库
        queue = FMDatabaseQueue(path: path)
        
        createTable()
    }
}

// MARK: - 微博数据库操作
extension SQLiteManger{
    // 新增或修改微博数据库
    func updateStatus(userId: String,array:[[String:AnyObject]]){
        // SQL
        let sql = "INSERT OR REPLACE INTO T_Status (statusId, userId, status) VALUES (?, ?, ?);"
        // 执行SQL
        queue.inTransaction { (db, rollback) in
            // 遍历数组，逐条插入微博数据
            for dict in array {
                // 从字典获取微博代号／将字典序列化成二进制数据
                guard let statusId = dict["idstr"] as? String,
                    let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: [])
                    else {
                        continue
                }
                
                // 执行 SQL
                if db?.executeUpdate(sql, withArgumentsIn: [statusId, userId, jsonData]) == false {
                    // 需要回滚 *rollback = YES;
                    // Xcode 的自动语法转换，不会处理此处！
                    // Swift 1.x & 2.x => rollback.memory = true;
                    // Swift 3.0 的写法
                    rollback?.pointee = true
                    break
                }
                
                // 模拟回滚
                // rollback?.pointee = true
                // break
            }

        }
    }
    
    func loadStatus(userId: String, since_id: Int64 = 0, max_id: Int64 = 0) -> [[String: AnyObject]] {
        // 1. 准备 SQL
        var sql = "SELECT statusId, userId, status FROM T_Status \n"
        sql += "WHERE userId = \(userId) \n"
        // 上拉／下拉，都是针对同一个 id 进行判断
        if since_id > 0 {
            sql += "AND statusId > \(since_id) \n"
        } else if max_id > 0 {
            sql += "AND statusId < \(max_id) \n"
        }
        sql += "ORDER BY statusId DESC LIMIT 20;"
        // 拼接 SQL 结束后，一定一定一定要测试！
        print(sql)
        // 2. 执行 SQL
        let array = execRecordSet(sql: sql)
        // 3. 遍历数组，将数组中的 status 反序列化 -> 字典的数组
        var result = [[String: AnyObject]]()
        for dict in array {
            // 反序列化
            guard let jsonData = dict["status"] as? Data,
                let json = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: AnyObject]
                else {
                    continue
            }
            // 追加到数组
            result.append(json ?? [:])
        }
        return result
    }

}

// MARK: - 私有方法
extension SQLiteManger{
    func createTable(){
        // SQL
        guard let path = Bundle.main.path(forResource: "status.sql", ofType: nil) ,
        let sql = try? String(contentsOfFile: path) else{
            return
        }
        print(sql)
        
        // FMDB 的内部队列，串行队列，同步执行
        // 可以保证同一时间,只有一个任务操作数据库,从而保证数据库的读写安全
        queue.inDatabase { (db) in
            // 只有在创表的时候使用执行多条语句,可以一次创建多个数据库
            // 在执行增删改的时候,一定不要使用statements方法,否则有可能会注入
            if db?.executeStatements(sql) == true {
                print("创表成功")
            }else{
                print("创表失败")
            }
        }
        
        print("Over")
    }
    
    func execRecordSet(sql: String) -> [[String: AnyObject]] {
        // 结果数组
        var result = [[String: AnyObject]]()
        // 执行 SQL - 查询数据，不会修改数据，所以不需要开启事务！
        // 事务的目的，是为了保证数据的有效性，一旦失败，回滚到初始状态！
        queue.inDatabase { (db) in
            guard let rs = db?.executeQuery(sql, withArgumentsIn: []) else {
                return
            }
            // 逐行 - 遍历结果集合
            while rs.next() {
                // 1> 列数
                let colCount = rs.columnCount()
                // 2> 遍历所有列
                for col in 0..<colCount {
                    // 3> 列名 -> KEY / 值 -> Value
                    guard let name = rs.columnName(for: col),
                    let value = rs.object(forColumnIndex: col) else {
                            continue
                    }
                    
                    // print("\(name) - \(value)")
                    // 4> 追加结果
                    result.append([name: (value as AnyObject)])
                }
            }
        }
        return result
    }

}
