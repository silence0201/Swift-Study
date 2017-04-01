
import Foundation

var weeksNSSet: NSSet = ["星期一","星期二", "星期三", "星期四", "星期五", "星期六","星期日"]
//将NSSet转换为Set
var weeksNames1 = weeksNSSet as Set<NSObject>

var weeksSet: Set = ["星期一","星期二", "星期三", "星期四", "星期五", "星期六","星期日"]
//将Set转换为NSSet
var weeksNames2 = weeksSet as NSSet
