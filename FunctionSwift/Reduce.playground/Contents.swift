//: Playground - noun: a place where people can play

import Foundation
/* 不要在列表中使用循环，使用 map 和 reduce。 */

// Reduce 例子 #1

let sum = [0, 1, 2, 3, 4].reduce(0) { (result, num) -> Int in
    return result + num
}

print(sum) // 10

// Reduce 例子 #2

// 协助代码

let greetings: [NSString]  = ["Hello, World", "Hello, Swift", "Later, Objective-C"]

/// 非函数式的 ///

var helloCount = 0

for greeting in greetings {
    if  greeting.contains("Hello"){
        helloCount += 1
    }
}

print(helloCount)

/// 函数式的 ///
let helloCountFunc = greetings.reduce(0) { (result, str) -> Int in
    var count = 0
    if str.contains("Hello"){
        count = 1
    }
    return result + count
}

print(helloCountFunc)


