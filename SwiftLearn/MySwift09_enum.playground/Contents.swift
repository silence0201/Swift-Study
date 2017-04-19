//: Playground - noun: a place where people can play

import UIKit

/*** Swift OO enum 枚举是值类型的 **/
//枚举 月份 季度
//枚举是一种全新的数据类型
//枚举型变量背后都是一个整形, 每一个枚举型的变量都和一个整型关联着.
//raw value
enum Month : Int{
    case January = 1
    case February = 2
    case March = 3
    case April = 4
    case May = 5
    case June = 6
    case July = 7
    case August = 8
    case September = 9
    case October = 10
    case November = 11
    case December = 12
    
}

enum Season{
    case Spring, Summer, Autumn, Winter
}

//指定rawValue类型是Int, Spring = 1, 后面的可以不写了, 会自动增加.
enum Season2: Int{
    case Spring = 1, Summer, Autumn, Winter
}
Season2.Summer.rawValue //2

let curMonth: Month = .January //已经确认了curMonth的类型, 就不用Month.January, 直接以.号开头即可.

func season(month : Month) -> Season{
    switch month{
    case Month.March, Month.April, Month.May:
        return .Spring
    case .June, .July, .August:
        return .Summer
    case .September, .October, .November:
        return .Autumn
    case .December, .January, .February:
        return .Winter
    }
}

//还有几个月到新年.
func monthsBeforeNewYear(month: Month) -> Int{
    return 12 - month.rawValue
}

let input = 4
if let month = Month(rawValue: input) { //month是可选型 Month?
    monthsBeforeNewYear(month: month)
}

enum Grade: Int{
    case F=0, E, D, C, B, A
}

let grade: Grade = .A

enum Grade2: Int{
    case F, E, D, C, B, A
}
Grade2.F.rawValue

enum Grade3{ //没有指定枚举值rawValue类型.
    case F, E, D, C, B, A
}
//rawValue的类型必须被显示指定, 否则不能使用.
//Grade3.F.rawValue //error: 'Grade3' has no member 'rawValue'

//枚举的rawValue类型可以任意指定值
enum Coin: Int{
    case Penny = 1
    case Nickel = 5
    case Dime = 10
    case Quarter = 25
}

let coin: Coin = .Quarter
print("It's \(coin.rawValue) cents")

//指定枚举的rawVlaue是String
enum ProgrammingLanguage: String{
    case Swift
    case ObjectiveC = "Objective-C"
    case C = "c"
    case Java = "Java"
}
ProgrammingLanguage.Swift.rawValue

let myFavoriteLanguage: ProgrammingLanguage = .ObjectiveC
print("\(myFavoriteLanguage.rawValue) is my favorite language.")


/*** Associate Value 关联值 **/
// *** 关联值对于枚举型不是必须的. 如果枚举定义了rawValue类型, 就不能再定义 Associate Value了. ***
enum ATMStatus{
    case Success(Int) //当提款成功后, 将Success状态关联余额值.
    case Error(String) //当提款失败后, 将错误信息关联到失败状态上.
    case Waiting
}

var balance = 1000 //账户总额
//提款函数.
func withdraw(amount: Int) -> ATMStatus{
    if balance >= amount{
        balance -= amount
        return .Success(balance)
    }
    else {
        return .Error("Not enough money")
    }
}

let result = withdraw(amount: 100)
switch result{
    case let .Success(newBalance):
        print("\(newBalance) Yuan left in your account")
    case let .Error(errorMessage):
        print("Error: \(errorMessage)")
case .Waiting:
    print("Waiting")
}

/*** 注: 事实上当枚举关联多个值时, 其本质上是关联一个值, 这个值是元组. 就可以给这个元组起 分量名 **/
//定义各种形状.
enum Shape{
    case Square(side: Double)
    case Rectangle(width: Double, height: Double)
    case Circle(centerx: Double, centery: Double, radius: Double)
    case Point
}

//函数-> 给出形状求面积(公式).
func area(shape : Shape) -> Double{
    switch shape{
    case let .Square(side):
        return side * side
    case let .Rectangle(width, height):
        return width * height
    case let .Circle(_ , _ , r): //使用_忽略没用的参数.
        return M_PI * r * r
    case .Point:
        return 0
    }
}

let square = Shape.Square(side: 10)
let rectangle = Shape.Rectangle(width: 20, height: 30)
let circle = Shape.Circle(centerx: 0, centery: 0, radius: 15)
let point = Shape.Point

area(shape: square)
area(shape: rectangle)
area(shape: circle)
area(shape: point)

/*** 可选型实质是枚举 **/
var age: Int? = 17
print(age ?? -1)

age = nil

//声明一个可选型, Optional<String> 等价于 String?
var website: Optional<String> =  Optional.some("imooc.com")
website = Optional.none

var website222: String? = Optional.some("imooc.com") //"imooc.com"
website222 = Optional.none //nil

switch website222{ //swifch String?
case .none:
    print("No website")
case let .some(website):
    print("The website is \(website)")
}

if let website = website{
    print("The website is \(website)")
}
else{
    print("No website")
}

//注: 以上本质上说明可选型就是一个枚举类型.

/*** 枚举的递归 使用 **/
//对于递归的枚举需要用indirect 修饰.
//算术表达式
//indirect enum ArithmeticExpression{
//    case Number(Int)
//    case Addition(ArithmeticExpression, ArithmeticExpression)
//    case Multiplication(ArithmeticExpression, ArithmeticExpression)
//}

//也可以如此定义 递归的枚举
enum ArithmeticExpression{
    case Number(Int)
    //给关联值元组的每个元素起个分量名
    indirect case Addition(left: ArithmeticExpression, right: ArithmeticExpression)
    indirect case Multiplication(ArithmeticExpression, ArithmeticExpression)
}

//(5+4)*2
let five: ArithmeticExpression = .Number(5)
let four = ArithmeticExpression.Number(4)
let sum = ArithmeticExpression.Addition(left: five, right: four)
let two = ArithmeticExpression.Number(2)
let product = ArithmeticExpression.Multiplication(sum, two)
//product即是表达式 (5 + 4) * 2

//定义解析表达式的函数.
func evaluate(expression: ArithmeticExpression) -> Int{
    switch expression{
    case let .Number(value):
        return value
    case let .Addition(left, right): //如果expression匹配Addition枚举值, 用left赋值数据给它的关联值元组的每个分量.
        return evaluate(expression: left) + evaluate(expression: right)
    case let .Multiplication(left, right):
        return evaluate(expression: left) * evaluate(expression: right)
    }
}

evaluate(expression: product)













