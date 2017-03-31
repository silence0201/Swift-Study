

import Foundation

let foundationString: NSString = "alpha bravo charlie delta echo"

//从NSString到String
let swiftString = foundationString as String

//从String到NSString
let foundationString2 = swiftString as NSString

//使用NSString的components(separatedBy:)方法
let swiftArray = foundationString2.components(separatedBy: " ")

let intString: NSString = "456"
//通过Int构造函数将String转换为Int类型
let intValue = Int(intString as String)
