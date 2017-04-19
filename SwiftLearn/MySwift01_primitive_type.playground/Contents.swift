//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

var str = "Hello, playground"  //playground 意为XCode是试验场.

/***
 ** 常量 变量 的声明
***/
let a = 100  //<<声明常量>> a 等于100
let b = 200
a+b //两个常量相加, 在XCode中 可以点击右侧的小圆圈定位出表达示的值, 也可以使用小眼睛显示计算出表达示的值.
print(a+b)

var value = 2  //<<声明变量>> vlaue 等于2
while value < 10000{ //当vlaue 小于 10000时一直循环下去.
    value *= 2
}

var maxNum = 1000
maxNum = 1 //给变量maxNum赋值为 1

var webSite: String = "www.baidu.com" //声明变量webSite后跟冒号指明其为String类型的变量.

print(webSite)

/***
 ** 整型 数据类型.
 **    一般使用Int类型, 默认长度由使用的机器决定. 如本机是64位的系统, 则Int就代表着Int64的长度.
***/
Int.max //输出Int的最大值

Int16.max //16位的Int数据最大值

Int32.max //32位

Int64.max //64

INT64_MAX //常量64位最大值

var imUInt: UInt = 10 //无符号 Int类型 UInt不能为复数, 否则XCode会提示你错误.\

UInt.max //UInt的最大值
UInt.min

UInt64.max  //UInt64的最大值

Float.abs(0.1)

/***
 ** 不同进制的表示形式
***/
let binaryInt: Int = 0b10001 //二进制的Int数据, 以 0b 开头

let octalInt: Int = 0o21 //八进制的Int数据, 以 0o 开头

let hexInt: Int = 0x11 //十六进制的Int数据, 以 0x 开头

let bignum = 100_0000  //对于大数据的书写形式, 可以用下划线来分隔, 以方便显示.
let bignumZH = 100_0000 //中国习惯为四位一组的.

let imFloat: Float = 3.1415926  //声明单精度数据类型. 注意当小数到第6位后就无法显示了, 会进位的.
let imDoublue: Double = 3.1415926 //声明双精度数据类型. 注意默认小数数据如果不指定其类型, 默认是Double类型的

/***
 * 小技巧: 按住option健 指向变量名 弹出?号时点击 即会弹出变量的类型信息.
***/

let x = 3.1415926
var aa = 1.25e10 //科学数据的表示
var bb = 1.25e-8

var cc = 1_000_000.000_000_1 //符点数的分隔表示形式.


/***
 ** 数据类型转换
 ** Swift是强类型的语言, 不同类型的数据操作时必须强制转换为一致的数据类型方能操作.
***/
let xx: UInt16 = 100
let yy: UInt8 = 20
let xxyy = xx+UInt16(yy) //强制转换yy为16位的Int类型.
let xxxyyy = UInt8(xx) + yy

let w:Float = 3 //即使3看起来是Int型数据, 但指定了其变量w为Float类型, 其即是Float类型
let v:Int = Int(3.0) //在赋值时, 同样也必须为指定类型的变量赋值相同的类型.

let xyz:float_t = 9.09991

//CGFloat 一种特殊的Float符点类型.
let red:CGFloat = 0.2
let green:CGFloat = 0.5
let blue:CGFloat = 0.3
UIColor(red: red, green: green, blue: blue, alpha: 1.0) //UIColor中必须使用CGFloat类型的数据.

/***
 ** Boolean 值的使用 
 **    true 和 false 必须是小写的
***/
let imTrue = true
let imFalse = false
imTrue && imFalse

/***
 ** 条件语句的使用.
 **    条件执行体必须是由{}括起来的. 那怕只有一行执行语句的.
***/
if imTrue{  // if语句条件表达示可以不用()号来限定, 但是必须是boolean类型的变量或常量, 亦或者是表达式
    print("i'm True")
}

if imFalse {print("i'm True")}
else if imTrue{
    print("i'm False")
}

//if 1{} //Swift不支持1来代表boolean类型, 只能是boolean类型或表达示.
if 1 == 1{
    print("true")
}

/***
 ** Tuple 元组的使用
***/
var point = (5, 2)
var httpResponse = (404, "Not Fount")  //元组可以支持不同的数据类型.

var point2:(Int, Int, Int) = (10, 5, 2)  //声明式赋值
var httpResponse2:(Int, String)=(200, "OK")

httpResponse2.1 = "OKl"

var (xp, yp) = point //元组赋值给元组, 等于给元组中的xy, yp进行赋值了
xp = 2
print(xp)

let point3 = (xp3: 33, yp3: 2) //给point3常量赋值元组数据. 其中指明了元组的下标.

point3.xp3
point3.0  //元组的引用
point3.1

let point4: (xp4: Int, yp4: Int) = (10, 5)  //声明元组的下标和类型, 同时为其赋值.
point4.xp4
point4.0

let loginResult = (true, "liuyuboobo")
let (isLoginSuccess, _) = loginResult  //*** 使用下划线来占位不使用元组的某项值.

if( isLoginSuccess){
    loginResult.1
}

/***
 ** 变量名
***/
let imoocUrl: String = "www.imooc.com";  //定义字符串类型.

var 名字="康桥😀"  //变量名可以使用中文等任意的UNCode字符.
名字.characters.count
print("我的名字是"+名字)
var 😀 = "smile" //变量名也可以使用特殊字符 😀[control + command + space]调出面板输入.

/***
 ** Print 的使用
***/
print(😀)
😀.characters.count

let xxx=1, yyy=2, zzz=3, bbb=true
print(xxx, yyy, zzz, bbb) //print可以同时输出多个变量. 用豆号隔开, 每个豆号会被转换为一个空格
print(xxx, yyy, zzz, separator:"___")  //使用separator指定print函数中变量值的分隔符.
print(xxx, yyy, zzz, separator:"___", terminator:";)")//使用terminator指定print输出以什么结束, 默认是\n结束的
print("kangqiao")
print(print(😀))

print(xxx, "*", yyy, "=", xxx * yyy)  // 格式式输出
print("\(xxx) * \(yyy) = \(xxx * yyy)")  //使用反斜线加()号进行格式输出.

// 这是注释
/**
 * 这是多行注释
 * /*
 *  * 这是多行注释里面的多行注释
 *  * 看见了吧
 *  */
 *
 **/








