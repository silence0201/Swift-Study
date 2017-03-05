//
//  Person.swift
//  WebDemo
//
//  Created by 杨晴贺 on 2017/3/5.
//  Copyright © 2017年 Silence. All rights reserved.
//

import UIKit

class Person: NSObject {
    var name: String?
    var age: Int = 0
    
    init(name: String){
        self.name = name
        super.init()
    }
    // 遍历构造函数允许返回nil,正常的构造函数一定会返回创建的对象
    // 片段给定的参数是否满足添加,如果不满足条件就直接返回nil,不会创建对象,减少内存开销
    // 没有convenience的关键字是用来创建对象的
    convenience init?(name:String, age: Int){
        if age > 100 {
            return nil
        }
        self.init(name: name)
    }
}
