
import Foundation

let number1: Int = 0

//Int转换为NSNumber
let numberObj1 = NSNumber(value: number1)  //通过构造函数转换
let numberObj2 = number1 as NSNumber //桥接转换

//NSNumber转换为Int
let number3 = numberObj1.intValue   //通过方法转换
let number4 = numberObj1 as! Int     //桥接转换
