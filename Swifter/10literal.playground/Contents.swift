//: Playground - noun: a place where people can play

import Foundation

let aNumber = 3
let aString = "Hello"
let aBool = true

let anArray = [1,2,3]
let aDictionary = ["key1": "value1", "key2": "value2"]

typealias ALC = ExpressibleByArrayLiteral
typealias BLC = ExpressibleByBooleanLiteral
typealias DLC = ExpressibleByDictionaryLiteral
typealias FLC = ExpressibleByFloatLiteral
typealias NLC = ExpressibleByNilLiteral
typealias ILC = ExpressibleByIntegerLiteral
typealias SLC = ExpressibleByStringLiteral

enum MyBool: Int {
    case myTrue, myFalse
}

extension MyBool: ExpressibleByBooleanLiteral {
    init(booleanLiteral value: Bool) {
        self = value ? .myTrue : .myFalse
    }
}

let myTrue: MyBool = true
let myFalse: MyBool = false

myTrue.rawValue    // 0
myFalse.rawValue   // 1