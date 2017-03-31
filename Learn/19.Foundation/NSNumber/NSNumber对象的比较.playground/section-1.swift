
import Foundation

var intSwift = 80
var intNumber  = NSNumber(value: intSwift)
var floatNumber = NSNumber(value: 80.00)
if intNumber.isEqual(to: floatNumber) {
    NSLog("相等")
} else {
    NSLog("不相等")
}

switch intNumber.compare(floatNumber) {
case .orderedAscending:
    NSLog("第一个数小于第二个数")
case .orderedDescending:
    NSLog("第一个数大于第二个数")
case .orderedSame:
    NSLog("第一个数等于第二个数")
}
