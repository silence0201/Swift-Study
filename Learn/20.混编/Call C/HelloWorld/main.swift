//
//  File.swift
//  HelloWorld
//
//  Created by 杨晴贺 on 2017/4/1.
//  Copyright © 2017年 tonyguan. All rights reserved.
//

import Foundation

let greeting = "Good morning."
let name = "Tony"

//sayHello(greeting: UnsafePointer<Int8>, name: UnsafePointer<Int8>)
//返回值UnsafePointer<Int8>!类型
let cHello =  sayHello(greeting, name)

let sHello = String(cString: cHello!)

print(sHello)
