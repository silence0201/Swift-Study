//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/***
 * 数组 Array
 **/
//初始化数组
var numbers = [0, 1, 2, 3, 4, 5] //[Int]类型的数组.
var vowels = ["A", "E", "I", "O", "U"] //[String]类型的数组.

//数组类型声明和设置每个元素的初始值.
var numb2: [Int] = [0, 1, 2, 3, 4, 5]
var numb3: Array<Int> = [0, 1, 2, 3, 4, 5] //声明Array<Int>类型数组.
var vow2: [Character] = ["A", "E", "I", "O", "U"]  //声明字符类型的数组, 必须显示声明, 否则默认为String类型的数组.
var vow3: Array<String> = ["A", "E", "I", "O", "U"]

//声明空数组.
var emptyArray1: [Int] = []
var emptyArray2: Array<Int> = []
var emptyArray3 = [Int]() //声明数组, 其实是调用了构造函数.
var emptyArray4 = Array<Int>() //声明空数组, 用了Array<Int>的构造函数声明.

//初始化数组初值.
//var allZeros = [Int](count: 5, repeatedValue: 0) //初始化一个5个元素都是0的数组. //swift2
var allZeros = [Int](repeating: 0, count: 5) //swift3

//var allZeros2 = Array<Int>(count: 5, repeatedValue: -1) //用Array<Int>的构造函数初值设置默认值.  //swift2
var allZeros2 = Array<Int>(repeating: -1, count: 5) //swift3

//ObjectC中的NSArray
//var array = [] //NSArray 不建议使用. *** //swift3 不可用了

/*** 数组的属性和方法 **/
vowels.count
numb2.isEmpty
emptyArray1.isEmpty

vowels[3]
//vowels[-1] //角标越界

//first last 返回可选型, 因为你不能保证数组的有第一个元素和最后一个元素
var first = vowels.first //返回可选型 String?
vowels.last
var first1 = emptyArray1.first // Int?

if let firstVowel = vowels.first{ //解包数组的第一个元素
    print("The first vowel is" + firstVowel)
}

vowels.first!
vowels[vowels.count - 1] //获取最后一个元素

//numbers.minElement() //调用数组的方法 最小值 //swift2
numbers.min() //swift3
//numbers.maxElement() //最大值方法 //swift2
numbers.max() //swift3
//vowels.minElement() //A //swift2
vowels.min() //swift3
//vowels.maxElement() //U //swift2
vowels.max() //swift3

numbers[2..<4] //获取numbers数组中2到4(不含)
vowels.contains("A")
vowels.contains("B")

//var index = vowels.indexOf("E") //返回Index?可选型 //swift2
var index = vowels.index(of: "E") //swfit3

/*** 数组是遍历 **/
for index in 0..<numbers.count{
    print(numbers[index], terminator:" ")
}
print("")

for num in numbers{
    print(num, terminator:" ")
}
print("")

//推荐使用
for (i, vowel) in vowels.enumerated(){ //用元组接收数据的enumerate集合, 包含(下标, 值) //swift3 enumerated()
    print("\(i): \(vowel)", terminator:" ")
}

numbers = [0, 1, 2, 3, 4, 5]
var oneToFive = [0, 1, 2, 3, 4, 5]
numbers == oneToFive //对数组比较, 比较的是数组当中的值

/*** 数组的增, 删, 改 注:不能操作用let声明的常量数组, 只能改var声明的数组 **/
var courses = ["你好", "康桥", "Hello World!"]
courses.append("Swfit")

print(courses)
courses += ["IOS", "Android"]
print(courses)
courses.insert("Swift设计模式", at: 2) //插入 注意数组不能越界. //swfit3
print(courses)

courses.removeLast()
print(courses)
courses.removeFirst()
print(courses)
//courses.removeAtIndex(2) //注意数组越界 //swfit2
courses.remove(at: 2) //swift3
print(courses)
//courses.removeRange(0..<4) //数组越界 //swift2
courses.removeSubrange(0..<4) //swift3
print(courses)

courses += ["你好", "康桥", "Hello World!"]
courses[0] = "你好 hi"
print(courses)
courses[1...2] = ["1你好", "2康桥"]
print(courses)
courses[0..<2] = ["hello"] //注意越界, 修改0..<2间的数组元素为一个元素值.
print(courses)

/*** 二维数组 **/
var board = [
    [1024, 16, 2, 0],
    [256, 4, 2, 0],
    [64, 2, 0, 0],
    [2, 0, 0, 0]]

board[0] //二维数组中的第一行数据.
board[0][0] //二维数组的第0行第0列的值.
board.count //二维数组的行数.
board[0].count //二维数组的第0行数据有几列数据.

board[0].append(0) //对第0行数组增加一个元素
board
board.append([0,0,0,0,0,0,0]) //对二维数组增加一行数据.
board

board += [[0,0,0,0]] //增加一行数据. 注:需要再包一个[]

//NSArray是一个类, 采用引用的方式传递
//而Swift中的数组是一个结构. 采用值的方式传递 *****
/*** NSArray 不建议使用了. **/
//var arr = [] //NSArray 不确定使用了什么类型. //swift3 不能用了
var arr2 = [1, 2, 3, 4, 5] as NSArray
var arr3: NSArray = [1, "Hello", 3.09]

var arr4: [Any] = [1, "hello", 3.28] //[NSObject]的类型, 等于把Swift中的数组中值的类型是NSObject类型. 在OC是所有对象的超类.
//NextStep 公司的基础代码.
//NS为前缀的类都在 import Foundation 包中, 当我们IOS开发时, 主要import UIKit, 其中已经包含了Foundation了.




































