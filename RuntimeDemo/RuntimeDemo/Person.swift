//
//  Person.swift
//  RuntimeDemo
//
//  Created by 杨晴贺 on 2017/3/5.
//  Copyright © 2017年 Silence. All rights reserved.
//

import UIKit

class Person: NSObject {
    var name: String?
    var age: Int = 0   // 基本数据类型在oc没有可选,如果定义成可选运行时同样获取不到,因此使用KVC会崩溃
    var title: String?
    
    private var no:String? // 使用私有标识符也不能获取到
    
    // 获取当前类的所有属性数组
    static func propertyList() -> [String]{
        var count: UInt32 = 0
        
        var result:[String] = []
        // 获取类的属性列表
        let list =  class_copyPropertyList(self, &count)

        print("属性的数量: \(count)")
        
        for i in 0..<Int(count){
            let pty = list?[i]
            // 获取属性的名称
            let cName =  property_getName(pty!)  // 对应c语言字符串
            
            // 转化成oc字符串
            let name = String(utf8String: cName!)
            result.append(name ?? "")
        }
        
        free(list)
        return result
    }
    
}
