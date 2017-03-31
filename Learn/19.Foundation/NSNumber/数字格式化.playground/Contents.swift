
import Foundation

let number = 1_2345_6789
let numberObj = NSNumber(value: number)

let formatter = NumberFormatter()

//十进制数字
formatter.numberStyle = .decimal //NumberFormatter.Style.decimal
var stringNumber = formatter.string(from: numberObj)
print("DecimalStyle : \(stringNumber!)")

//科学计数法
formatter.numberStyle = .scientific
stringNumber = formatter.string(from: numberObj)
print("ScientificStyle : \(stringNumber!)")

//百分数
formatter.numberStyle = .percent
stringNumber = formatter.string(from: numberObj)
print("PercentStyle : \(stringNumber!)")

//货币
formatter.numberStyle = .currency
stringNumber = formatter.string(from: numberObj)
print("CurrencyStyle : \(stringNumber!)")

//大写数字
formatter.numberStyle = .spellOut
stringNumber = formatter.string(from: numberObj)
print("SpellOutStyle : \(stringNumber!)")

//设置本地化标识
for localId in ["en_US", "fr_FR", "zh_CN"] {
    formatter.locale = Locale(identifier: localId)
    //货币
    formatter.numberStyle = .currency
    stringNumber = formatter.string(from: numberObj)
    print("\(localId) : CurrencyStyle : \(stringNumber!)")
    
    //大写数字
    formatter.numberStyle = .spellOut
    stringNumber = formatter.string(from: numberObj)
    print("\(localId) : SpellOutStyle : \(stringNumber!)")
}
