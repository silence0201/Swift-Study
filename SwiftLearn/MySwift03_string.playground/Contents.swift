//: Playground - noun: a place where people can play

import UIKit

print("==== Swift 字符串 String 的语法特点及基本用法 ====")
var str: String = "Hello playground"
let str2 = String("Hello, Swift") //使用类和结构体初始化字符串

var emptyString = ""
var emptyString2 = String()

print(str.isEmpty)
print(emptyString.isEmpty)

let mark = " !!! "
print(str + mark)
print(str)
str += mark
print(str)

//str2 += mark //常量str2不可变

let name = "kangqiao"
let age = 18
let height = 1.78
let s = "My name is \(name), age is \(age). I'm \(height) meters"
print(s)

let s2 = "Begin \\ | \" | \t | \" End"
print(s2)

for c in str.characters{ //遍历str字符串中的每一个字符, c的类型是Character类型.
    print(c, terminator:" ")
}

let char: Character = "#" //声明了一个字符Character类型常量char.
str + String(char) //字符串与字符类型 相加 必须强制类型转换.
str.append(char)

print("Swift中字符串 和 字符类型fjtb是UNICODE的")

let englishLetter:Character = "a" //英文字符
let chineseLetter: Character = "我" //中文字符.
let dog: Character = "😈" //表情符号
let coolGuy: Character = "\u{1F60E}" //unicode编码 也代表一个字符.

//对于Swift语言中的字符串是基于UnicodeScalar的, 
// Swift字符串更智能, 更趋向于我们人类的理解. 这样也带来了字符串的处理效率不高.
var coolLetters = "abc"
coolLetters.characters.count
var chineseLetters = "你们好"
chineseLetters.characters.count
var coolGuys = "\u{1F60E}\u{1F60E}\u{1F60E}"
coolGuys.characters.count
var cafe = "café"
cafe.characters.count //4
var cafe2 = "cafe\u{0301}" //unicode注意符 \u{0301}
cafe2.characters.count //4 长度也是4个字符.
cafe == cafe2 //true. 这两个字符串声明时


//字符串的索引
str = "Hello, Swift"
//str[0] //这是错误的
//str.characters[0] //这是错误的
let startIndex = str.startIndex //str字符串的起始Index, 注意它是Index类型的亦是, 并不是Int类型.
str[startIndex] //"H"
//str[startIndex.advancedBy(5)] //"," //swift2
str[str.index(startIndex, offsetBy: 5)] //"," //swift3

//let spaceIndex = startIndex.advancedBy(6) //6 //swift2
let spaceIndex = str.index(startIndex, offsetBy: 6) //6 //swift3
spaceIndex //6
//str[spaceIndex.predecessor()]  //"," //spaceIndex前一个字符. //swift2
str[str.index(before: spaceIndex)]  //"," //spaceIndex前一个字符. //swift3
//str[spaceIndex.successor()] //"S" spaceIndex后一个字符.
str[str.index(after: spaceIndex)]//"S" spaceIndex后一个字符.

let endIndex = str.endIndex //12 最后一个字符的下标.
//str[endIndex] //下标越界了
//str[endIndex.predecessor()] //用endIndex.predecessor()来表示最后一个字符. //swift2
str[str.index(before: endIndex)] //swift3

str[startIndex..<spaceIndex] //"Hello,"
//let range = startIndex..<spaceIndex.predecessor() //圈定str字符串中的某个区间. //swift2
let range = startIndex..<str.index(before: spaceIndex) // swift3

//str.replaceRange(range, with: "Hi") //用 "Hi" 替换range中的字符串. //swift2
str.replaceSubrange(range, with: "Hi") //swift3

//str.appendContentsOf("123") // "Hi, Swift123" /swift2
str.append("123") //swift3

//str.insert("?", atIndex: str.endIndex) //"Hi, Swift123" //swift2
str.insert("?", at: str.endIndex) //swfit3

//str.removeAtIndex(str.endIndex.predecessor()) //"?" //swift2
str.remove(at: str.index(before: str.endIndex)) //swift3

str //"Hi, Swift123"
//str.removeRange(str.endIndex.advancedBy(-2)..<str.endIndex) //"Hi, Swift1" 删除后两个字符. //swift2
str.removeSubrange(str.index(str.endIndex, offsetBy: -2)..<str.endIndex) //swift3

//str.uppercaseString  //"HI, SWIFT1" //swift2
str.uppercased() //swift3

//str.lowercaseString  //"hi, swift1" //swift2
str.lowercased() //swift3

//str.capitalizedString //"Hi, Swift1" 单词首字母大写 方法 //swift2
str.capitalized //swift3

//str.containsString("Hello") //false //swift2
str.contains("Hello") //swift3

str.hasPrefix("Hi")  //true 是否以"Hi"开头
str.hasSuffix("ft1") //true 是否以"ft1"结束

let p1 = "one third is \(1.0/3.0)" //"one third is 0.333333333333333"
// 使用OC中的NSString 格式化保留两位小数, 并使用as强制转换为Swift的String类型.
let p2:String = NSString(format: "one third is %.2f", 1.0/3.0) as String

var p3:NSString = "one third is 0.33" //声明并赋值一个NSString字符串变量.
//p3.substringFromIndex(4) //NSString截取字符从第4个字符开始. //swift2
p3.substring(from: 4) //swift3

//p3.substringToIndex(3)  //NSString截取字符到第3个字符. //swift2
p3.substring(to: 3) //swift3

//p3.substringWithRange(NSMakeRange(4, 5)) //"third" 4~9 //swift2
p3.substring(with: NSRange(location: 4, length: 5)) //swift3

// NSString 不是基于Unicode的.

let p4 = "😀😀😀" //Swift中的字符串.
let p5:NSString = "😀😀😀" //将Unicode字符串赋值给NSString变量.
p4.characters.count //3
p5.length //6 这说明NSString把Unicode的一个字符当作为2个字符了.

let p6 = "   --- Hello ---   " as NSString //将一个字符串转换为NSString.
// NSCharacterSet(charactersInString: " -")创建一个字符集,
//p6.stringByTrimmingCharactersInSet(NSCharacterSet(charactersInString: " -")) //Trim截取掉字符串的字符集 //swift2
p6.trimmingCharacters(in: CharacterSet(charactersIn: " -")) //swift3






















