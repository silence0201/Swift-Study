//: Playground - noun: a place where people can play

import UIKit

// 可选型 
// 操作灵活 大量使用
// 概念 使用方法 
// 

var eCode: Int = 404

//eCode = nil
//UICOlor color = nil
// nil是一种特殊的类型, 代表没有. 不可以直接赋值给其他任何类型变量.
var eCode2: Int? = nil // 声明errorCode2是整型可选型.
var color: UIColor? = nil  // 声明errorCode2是UIColor可选型.

let imInt = 405
eCode2 = imInt
// imInt = errorCode2 //报错.
print(eCode2!)

let imOptional: String? = nil

var errorCode: String? = "404"
print(errorCode as Any)

//可选型是不直接使用的, 这也是Swift是一门安全的语言.
// 如果要使用须要解包, 变量后加!号强制解包, 但是是有风险的, 因为你不知道变量是否是nil空.
//"The errorCode is " + errorCode
"The errorCode is " + errorCode!
if errorCode != nil{
    "The errorCode is " + errorCode!
}
else {
    "No error"
}

//我们尝试把errorCode解包并赋值给errorCode变量, 解包后即是非空的值, 且也不是可选型.
if let errorCode = errorCode{ //errorCode解包后只在{ }中有效使用
    "The errorCode is " + errorCode
}
else{
    "No error" //说明可选型errorCode为nil
}

var errorMessage:String? = "Not found"

// 一次解包多个可选型变量
if let errorCode = errorCode,
       let errorMessage = errorMessage {
    "The errorCode is " + errorCode + "\n The errorMessage is " + errorMessage
}

// 一次解包多个可选型变量 并 限定errorCode 等于 "404"的情况.
if let errorCode = errorCode,
    let errorMessage = errorMessage , errorCode == "404"{
        "The errorCode is " + errorCode + "\n The errorMessage is " + errorMessage
}

//可选型解包使用.
if let errorMessage = errorMessage{
    errorMessage.uppercased()
}
//功能同上, 虽然errorMessage是可选型, 尝试去解包并UpperCase, 如果是nil则什么也不做, 返回nil.
errorMessage?.uppercased()
errorMessage!.uppercased() //强制解包并UpperCase, 但是当errorMessage强制解包失败, 则报错.

//因为errorMessage可能尝试解包失败. 若失败则nil, 为了能够存住这个nil, 所以upperCaseErrorMessage也是可选型.
var upperCaseErrorMessage = errorMessage?.uppercased()

if let errorMessage = errorMessage?.uppercased(){ //可选型解包upppercase使用.
    errorMessage //"NOT FOUND"
}

//可选型解包使用3个实例.
var message: String
if let errorMessage = errorMessage{
    message = errorMessage
}
else{
    message = "No error"
}
message = errorMessage == nil ? "No error" : errorMessage!
message = errorMessage ?? "No error"

/***
 * 可选型在元组中的使用
 ***/
var error1: (errorCode: Int, errorMessage: String?) = (404, "Not found") //设置元组的errorMessage分量是可选型.
error1.errorMessage = nil
error1
//可选型元组变量.
var error2: (errorCode:Int, errorMessage: String)? = (404, "Not found")
error2 = nil
//可选型元组合变量, 且分量errorMessage也是可选型. 这样说明那些是可以为空nil
var error3: (errorCode:Int, errorMessage:String?)? = (404, "Not found")

//可选型实际应用.
var ageInput:String = "zx"
var age = Int(ageInput) //转换输入的"16"字符串.
print(age ?? "nil")

if let age = Int(ageInput) , age < 20{
    print("You're a teenager")
}

var greetings = "Hello"
var range1 = greetings.range(of: "ll") //返回一个前闭后开的区间Range<Index>?类型.
var range2 = greetings.range(of: "oo")

//隐式可选型, eMsg可以存放nil, 
// 使用的时候可以直接使用, 一旦为空, 就会报错, 这是危险的. 我们也可以对隐式的可选型进行解包, 但它就失去了可选型的意义了.
// 隐式可选型基本上完全用于: 当我们定义一个类时, 对类中的某些变量, 可能用隐式可选型, 这样当类刚创建时, 这个变量可以是nil
// 但是当用户真正使用这个变量时, 要保证这个类变量有值.
var eMsg:String! = nil //隐式可选型声明用!
eMsg = "Not found"
"The message is " + eMsg // 隐式可选型可直接使用.

//隐式可选型在类中实际应用.
class City{
    let cityName: String
    unowned var country : Country //unowned必免内存泄漏.
    init(cityName:String, country: Country){
        self.cityName = cityName
        self.country = country
    }
}
//由于在Country的构造函数中初始化成员capitalCity成员时, City构造时必需要country实例self,
//   但是此时Country实例还未构建完成, 此时若capital为可选型时, 就允许其暂时为空nil, 继续完成Country的初始化.
class Country{
    let countryName: String
    var capitalCity: City! //隐式可选型.
    init(countryName: String, capitalCity: String){
        self.countryName = countryName
        self.capitalCity = City(cityName: capitalCity, country: self)
    }
    
    func showInfo(){
        print("This is \(countryName).")
        print("The capital is \(capitalCity.cityName).")
    }
}

let china = Country(countryName: "china", capitalCity: "BeiJing")
china.showInfo()





































