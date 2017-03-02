//: Playground - noun: a place where people can play

// Swift基础

// 常量和变量声明
let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0

// 初始化多个
var x = 0.0,y = 0.0,z = 0.0

// 类型声明
var welcomeMessage: String
welcomeMessage = "Hello"

// 声明多个
var red,green,blue: Double

// 命名
let π = 3.14
let 你好 = "你好世界"
let 😁 = "HaHa"

// 变量修改
var friendlyWelcome = "Hello!"
friendlyWelcome = "你好!"

// 打印输出
print(friendlyWelcome)
print(π," ",你好," ",😁)  // 可以输出多个
print("当前打招呼的用于为:\(friendlyWelcome)") // 打印变量

// 注释

// 单行注释
/*
 多行注释
 */
/*
  // 嵌套注释
  /*嵌套注释*/
 */

// 句末不需要添加分号,分号应用
let cat = "🐈" ; print(cat)

// 整形
let minValue = UInt8.min
let maxValue = UInt8.max

// 浮点数
var d = 1.2
var w = [1,1.2]

// 类型推断
var meaningOfLife = 42
// meaningOfLife = 42.0 
let pi = 3.1415
let anther = 3 + 0.1415

// 数字字面量
let descimalInteger = 14
let binaryInterger = 0b10010
let octalInteger = 0o21
let hexadecimaInteger = 0x11

1.25e2   // 相当于 1.25 *10*10
1.25e-2

0xFp2
0x8p4 // 相当于8 * 2*2*2*2
0x4p-2

let decimalDouble = 12.123
let exponentDouble = 1.122e3
let hexadecialDouble = 0xC.3p0

let paddedDouble = 000123.456
let oneMillion = 1_000_000
let aBigNumber = 1_000_000.000_000_1

// 数字转换
let twoThounsand: UInt16 = 2_000
let one: UInt8 = 1
let twoThounsandAndOne = twoThounsand + UInt16(one)

let tree = 3
let fourOneFiveNie = 0.1414
let pi2  = Double(tree) + fourOneFiveNie

let integerPi = Int(pi)
let integerFou = Int(4.75)
let inrer = Int(-3.9)
3+0.14149

// 类型缩写
typealias AudioSample = UInt16
var  macAd: AudioSample = AudioSample.min

// Bool
let orangeAreAriange = true
let truendjd = false
if orangeAreAriange{
    print("True")
}else{
    print("False")
}

let i = 1
if i == 1 {
    print("i是\(i)")
}

// 元组
let http404Erro = (404,"Not Found")

let (statusCode,statusMessage) = http404Erro
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")

let (onlycode,_) = http404Erro
print("The Code \(onlycode)")

let (_,onlyMessage) = http404Erro
print("The Message \(onlyMessage)")


print("Code:\(http404Erro.0)")
print("Message:\(http404Erro.1)")

let http200Status = (status: 200,describe: "OK")
print("Status:\(http200Status.status)")
print("describe:\(http200Status.describe)")

// 可选项
let possibleNumber = "123"
let converedNumber = Int(possibleNumber)

var serverResponseCode: Int = 404
// serverResponseCode = nil

var serverResponOptionCode: Int? = 404
print("Response:\(serverResponOptionCode!)")
serverResponOptionCode = nil

var surversAnswer: String?
surversAnswer = "Asewr"
if serverResponOptionCode != nil {
    print("Not nil")
}

if surversAnswer != nil {
    print("\(surversAnswer!)")
}

if let surversAnswer = surversAnswer{
    print("\(surversAnswer)")
}

// 可选项解包
let possibleString: String? = "An optional string"
let forcedString = possibleString!

let assumeString: String! = "implicitly unwrapped"
let implicitly = assumeString

if possibleString != nil {
    print(possibleString ?? "")
}

if let possibleString = possibleString{
    print(possibleString)
}

func canThrowError() throws{
    // 这里可能会抛出异常
}

do{
    try canThrowError()
    // 没有异常抛出
}catch{
    // 抛出异常
}

enum SandwichError: Error{
    case OutOfCleanDishes
    case MissingIngredients([String])
}

func makeASandwich() throws{
    throw SandwichError.MissingIngredients(["butter","ham","bread"])
}
func eatASandwich(){
    print("yum yum yum")
}
func washDises(){
    print("Wash the Dishes")
}
func buyGroceriews(ingredients: [String]){
    ingredients.forEach { (i) in
        print(i)
    }
}

do{
    try makeASandwich()
    eatASandwich()
}catch SandwichError.OutOfCleanDishes{
    washDises()
}catch SandwichError.MissingIngredients(let ingredients){
    buyGroceriews(ingredients: ingredients)
}catch{
    print("Error")
}


// 断言
let age = 3
assert(age>0,"必须大于0")










