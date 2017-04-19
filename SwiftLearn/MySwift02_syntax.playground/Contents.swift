//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//if a=3    print("hello world");} //赋值语句不能当作条件判断语句来使用

var x = 10
var y = 3
var z = 0

//双目运算符
x + y
x - y
x * y
x / y
x % y
Double(x) / Double(y)

let u = 2.5
let v = 1.2
//u % v //swift3 中%求余运算只支持整数类型.

var xx = +x
var yy = -y

//单目运算符++ -- //swift3 中移除了 ++ -- 操作符.
x += 1
y -= 1
x += 1
y -= 1

x += 2
x %= 3

/***
 ** 比较运算符, 逻辑运算符
***/
var a = 3, b = 4
a == b
a != b
a > b
a >= b
a < b
a <= b

var stra = "Hello"
var strb = "Hello"
//stra === strb  // !==  引用运算符

let money = 100
let price = 70
if money >= price{
    print("buy it")
}
let capacity = 30
let volume = 50

if money >= price || capacity >= volume{
    print("can not buy it")
}

if !(money >= price && capacity >= volume){
    print("can buy it")
}

/***
 ** 三目运算符 条件? value1: value2
***/
var battery = 18
let batteryColor: UIColor //声明了一个常量, 但是可以不赋 初值, 可以在以后进行一次赋值.
//print(batteryColor) //声明了常量, 必须给其赋值完初值后才可以使用.
if battery <= 20{
    batteryColor = UIColor.red
}
else{
    batteryColor = UIColor.green
}
//batteryColor = UIColor.yellowColor() //不再给常量赋值了.
batteryColor

let batteryColor2 = battery <= 20 ? UIColor.red: UIColor.green

/***
 ** 区间运算符 
 **    闭区间运算符[a,b] a...b
 **    前闭后开区间运算符 [a,b) a..<b
***/
for index in 1...10 { //循环执行10次, 每一交都会将数值赋值给 index这个常量.
    index //print(index)
    //index = 5 //由于index是一个常量, 所以不能对其进行赋值.
}

//前闭后开 适用于遍历数组
for index in 0..<10 { //从0遍历到9, 不包含10; 例如当遍历数组时, 从数组下标0到数组长度-1的位置.
    print(index, terminator:" ")
}
print("")

/***
 ** 控制流
 **    顺序结构
 **    循环结构
 **    选择结构
***/
//循环结构
////for in 计算2的10次方
var result = 1
var base = 2
var power = 10
for _ in 1...power{ //使用_下划线占位, 代表运算10次.
    result *= base
}
result

//for循环 //循环体即使只有一句话也应该使用{}包起来. //swift3已经废弃了C Style的循环语句
// for initialization; condition; increments{
//     statements
// }
//for var a = -6.28; a <= 6.28; a += 0.1 {
//    sin(a)
//}
print("Swift3 new for style -- stride >>>")
for x in stride(from: -6.28, to: 6.28, by: 0.1) { // from ..< to
    print(x, separator: " ", terminator: " ")
}

var index = -99
var step = 1
//for ;index <= 99; index += step{ //用分号隔开的for循环初值, 判断, 增量, 都可以抽出
//    index * index
//    step *= 2
//}
for x in stride(from: -99, through: 99, by: step){ // from ... through
    print(x, separator: " ", terminator: " ")
}

print("==== while 循环实例====================")
// while 循环 适用于不清楚循环多少次结束
// initialization
// while condition{
//     statements
//     increments
// }
// a 和 b 同时掷骰子 只要连续赢3次就退出循环.
var aWin = 0
var bWin = 0
var game = 0
while aWin < 3 && bWin < 3{
    game += 1
    
    let a = arc4random_uniform(6) + 1
    let b = arc4random_uniform(6) + 1
    print("a is \(a), b is \(b).", terminator: "")
    
    if a > b{
        print("A win!")
        bWin = 0
        aWin += 1
    }
    else if a < b{
        print("B win!")
        aWin = 0
        bWin += 1
    }
    else{
        print("draw")
        aWin = 0
        bWin = 0
    }
}

//print(game)
let winner = aWin == 3 ? "A": "B"
print("After \(game) games, \(winner) win!")

print("====repeat while 循环实例=======================")
// repeat-while 类似于 do while 循环至少执行一次循环体
// iniaialization
// repeat{  //关键字repeat , do关键字被错误处理所使用了
//     statements
//     increments
// } while condition
var aaWin = false
var bbWin = false
repeat {
    let a = arc4random_uniform(6) + 1
    let b = arc4random_uniform(6) + 1
    print("a is \(a), b is \(b).", terminator: " ")
    
    if a > b {
        aaWin = true
    }
    else if a < b{
        bbWin = true
    }
    else{
        print("draw ", terminator:"")
    }
} while !aaWin && !bbWin

let winner2 = aaWin ? "A" : "B"
print(winner2, "win!")

// 控制转移 break 和 continue
print("==== 控制转移 break 和 continue ===============")
while true{
    let a = arc4random_uniform(6) + 1
    let b = arc4random_uniform(6) + 1
    
    print("a is \(a), b is \(b).", terminator:" ")
    if a == b {
        print("draw")
        continue //继续执行下一次循环
    }
    
    let winner = a > b ? "A" : "B"
    print("\(winner) win!")
    break //结束循环
}

// 选择结构 if - else - else if; switch //不需要break退出switch,
//    switch 能对多种类型进行case
//    switch 如果不能对所有情况进行case判断, 那么就必须使用default选项; 如果可以穷举则不需要default选择(示例3)
//    switch 当case或default选项 不需要进行处理时可以使用break或者()来作默认不处理操作.
print("==== 选择结构 if - else - else if; switch =======")
// switch some value to consider{
//     case value1:
//         respond to value1
//     case value2:
//         respond to value2
//     default:
//         otherwise, do something else
// }

let rating = "A"
switch rating{
case "A", "a": //同时满足 "A" 和 "a"的条件时都执行print("Great!")
    print("Great!")
case "B", "b":
    print("Just so-so")
case "C":
    print("It's Bad")
case "":
    break //或者使用()
default:  //switch时必须有default选项
    print("Error")
}

let aInt = 3
switch aInt{
case 0:
    print("I'm 0")
case 3:
    print("I'm right")
default:
    ()
}

let boolean = true
switch boolean{
case true:
    print("I'm true")
case false:
    print("I'm false")
} //因为可以穷举boolean值, 所以此处不需要default选项了.

print("==== switch 的高级用法 ============")
//对区间进行判断
let score = 95
switch score{
case 0:
    print("You got an egg!")
case 1..<60: //前闭后开区间
    print("You failed.")
case 60:
    print("Just passed")
case 61..<80:
    print("Just so-so")
case 80..<90:
    print("Good")
case 90...94: //闭区间
    print("Very Good")
case 95..<100:
    print("Great!")
case 100:
    print("Perfect!")
default:
    print("Error score.")
}

//对元组进行判断 把匹配, 解包, 赋值融合在一起了.
let point:(x:Int, y:Int) = (x:1, y:4)
switch point{
case (0,0):
    print("It's origin!")
case (1,0):
    print("It an unit vector on the positive x-axis.")
case (-1, 0):
    print("It an unit vector on the negative x-axis.")
case (_, 3): //元组的 x 坐标不管是什么都会匹配
    print("It an unit vector on the positive y-axis.")
case (3, let p): //单方面将point的y值赋于p, 并使用它.
    print("print p is \(p)")
case (-2...2, -2...2): //在元组中使用区间运算符
    print("(\(point.0), \(point.y)) is near the origin.") //在执行体中也可以使用point判断条件的值.
case (let x, let y): //将point赋值于了元组(x, y) 同时去匹配, 由于穷举了所有值, 就不需要default了.
    print("no match! (\(x), \(y)) ")
}

//swith fallthrough关键字
print("==== switch fallthrough 继续执行后续case语句 ====")
let ppp = (0, 0)
switch ppp{
case (0, 0):
    print("It's origin")
    fallthrough
case (_, 0):
    print("It's on the x-axis.")
    fallthrough
case (0, _):
    print("It's on the y-axis.")
default:
    print("It's just an ordinary point.");
}

print("==== break flagLoop 类似于goto语句 ====")
// 求 x^4 - y^2 = 15 * x * y 在300以内的一个正整数解
var gotAnswer = false
findAnswer:
for m in 1...300{
    for n in 1...300{
        if(m*m*m*m - n*n == 15*m*n){
            print(m, n)
            gotAnswer = true
            break findAnswer
        }
    }
}

print("==== where 限定语句在switch中的使用 ====")
// case value2 where condition:
let point2 = (3, 13)
switch point2{
case let(x, y) where x == y: //匹配point2坐标,并赋值于(x, y)元组, 同时又限定坐标的 x == y
    print("It's on the line x == y")
case (let x, let y) where x == -y: //类似上面的用法, 将point2解包并赋值于(x, y)
    print("It's on the line x == -y")
case let(x, y):
    print("It's just an ordinary point.")
    print("The point is (\(x), \(point2.1) )")
}

//判断age是否在10岁到19岁之间
let age = 19
if case 10...19 = age{ //case 10...19 模式要放在 判断条件前.
    print("You're a teenager.")
}

print("==== where 限定语句, 只要表达式返回一个boolean值即可 ====")
//age匹配在10...19之间, 同时限定age要大于等于18岁
if case 10...19 = age, age >= 18{
    print("You're a teenager and in a college.")
}

// for 循环中使用 限定语句 where.
for i in 1...100 where i % 3 == 0{
    print(i, terminator:" ") //由于没有指定
    //i += 6 //会报错, 因为for in循环时, i是常量, 可为限定语句和循环体使用, 但是不能改变其值.
}
print("")
//与上个循环无区别? case let 显示赋值常量 i 为区间循环值, 并为限定where所使用.
for case let i in 1...100 where i % 3 == 0{
    print(i, terminator:" ")
}

print("\n==== guard(保卫) 及代码风格初探:: 使用if else 也能实现 但是Swift建议使用guard代码风格 ====")
print("==== Swift建议我们首先进行边界的检查, 把和程序的核心逻辑不相关的程序剥离开, 最后就是核心逻辑 ====")
func buy(money: Int, price: Int, capacity: Int, volume: Int){
    guard money >= price else{
        //保证 money >= price 即我们有足够的钱去买这件商品, 否则else打印"Not enough money", 然后return
        print("Not enough money")
        return
    }
    
    guard capacity >= volume else{
        //保证 capacity >= volume 即我们有足够的空间来放置这件商品, 否则else打印"Not enough capacity", 然后return
        print("Not enough capacity")
        return
    }
    
    //当保证条件都满足后, 就可以真正的执行函数的主体部分了.
    print("I can buy it!")
    print("\(money-price) Yuan left.")
    print("\(capacity-volume) cubic meters left")
}

//buy(100, 90, 100, 100);






















