//
//  HelloWorld
//
//  Created by 杨晴贺 on 2017/4/1.
//  Copyright © 2017年 tonyguan. All rights reserved.
//

import Foundation

//============== 调用C++函数，没有类 =====================
let greeting = "Good morning."
let name = "Tony"

let cHello = sayHello(greeting, name)

let sHello = String(cString: cHello!)

print(sHello)


//============== 调用C++类 =====================
let a:Int32 = 10
let b:Int32 = 20

let wrapper = WrapperObjCObject()

var str = String(format: "调用CppObjectCppObject实例方法add: %d+%d=%d", a, b, wrapper.add(a,b))
print(str)

str = String(format: "调用CppObjectCppObject实例方法sub: %d-%d=%d", a, b, wrapper.sub(a,b))
print(str)

str = String(format: "调用CppObjectCppObject静态方法static_add: %d+%d=%d", a, b, WrapperObjCObject.static_add(a,b))
print(str)

str = String(format: "调用CppObjectCppObject静态方法static_sub: %d-%d=%d", a, b, WrapperObjCObject.static_sub(a,b))
print(str)
