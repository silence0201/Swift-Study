//: Playground - noun: a place where people can play

import UIKit

/*** 
 * 字典 Dictionary 
**/
var dict : [String : String] = ["swift": "雨燕", "python": "大蟒", "java": "爪哇岛", "groovy": "绝妙的"]
var dictt : Dictionary<String, String> = ["swift": "雨燕", "python": "大蟒", "java": "爪哇岛", "groovy": "绝妙的"]

var emptyDict1 : [String:Int] = [:]
var emptyDict2 : Dictionary<Int, String> = [:]
var emptyDict3 = [String: String]()
var emptyDict4 = Dictionary<Int, Int>()

print(dict["swift"] ?? "nil")  //返回的是可选型的数据, 因为你无法知道"swift"键是否存在.
dict["C++"] //nil 返回可选型的nil, 没有找到

if let value = dict["swift"] {
    print("swift is " + value)
}
dict.count
dict.isEmpty
emptyDict1.isEmpty

Array(dict.keys)
Array(dict.values)
//遍历字典的所有键, 值
for (key, value) in dict{
    print("\(key) : \(value)")
}

let dict1 = [1: "A", 2:"B", 3:"C"]
let dict2 = [1: "A", 3:"C", 2:"B"]
dict1 == dict2 //true 说明swift中字典和数组的比较是<值>的比较. 注字典是无序的, 且key不能重复.

/***
 * 字典的 增 删 改
**/
var user = ["name": "bobobo", "password":"liuyubo", "occupation":"programmer"]
//修改
user["occupation"] = "freeancer"
user.updateValue("imooc1", forKey: "password") //forKey标识要修改的键. "imooc"为最终要修改的值.

let oldPassword = user.updateValue("imooc1", forKey: "password") //返回 String?可选型.
if let oldPassword = oldPassword, let newPassword = user["password"] , oldPassword == newPassword{
    print("注意: 修改后的密码和之前一样, 可能导致安全问题!")
}

user["email"] = "imooc@imooc.com"
user
user.updateValue("imooc.com", forKey: "website")
user
user["website"] = nil
//var email = user.removeValueForKey("email")
if let email = user.removeValue(forKey: "email"){ //swift3
    print("电子邮箱 \(email) 被删除了")
}
user

//: Playground - noun: a place where people can play

import UIKit

/*** 集合 Set 声明与赋值 **/

var skillsOfA: Set<String> = ["swift", "OC", "OC"]

var emptySet1: Set<Int> = []
var emptySet2 = Set<Double>()

var vowels = Set(["A", "E", "I", "O", "U", "U"]) //将字符串数组转换成集合Set
var skillsOfB: Set = ["HTML", "CSS", "Javascript"] //将字符串数组转换成集合Set

skillsOfA.count

let set: Set<Int> = [2,2,2,2]
set.count

skillsOfB.isEmpty
emptySet1.isEmpty

let e = skillsOfA.first

skillsOfA.contains("swift") //true

for skill in skillsOfB{
    print(skill)
}

let setA: Set = [1, 2, 3]
let setB: Set = [3, 2, 1, 1, 2, 3, 1, 1, 1, 1]
setA == setB //true 这说明集合是无序的, 比较的是值.

/*** 集合的操作 **/
var seta: Set<String> = ["swift", "OC"]
var setb: Set<String> = ["HTML", "CSS", "Javascript"]
var setc: Set<String> = []

setc.insert("swift")
setc.insert("HTML")
setc.insert("CSS")
setc.insert("CSS")

let remCss = setc.remove("CSS")  //String?

let remJavaScript = setc.remove("Javascript") //nil

if let skill = setc.remove("HTML"){
    print("HTML is removed.")
}

//Set集合没有修改一个值的操作, 通常我们直接增加即可.
setc.insert("CSS")
setc.insert("Javascript")
setc.insert("HTML")

//并集
seta.union(setc) //并集
//seta.unionInPlace(setc) //并集, 且赋值setc到seta

//交集
//seta.intersect(setc) //swift2
seta.intersection(setc) //swift3

//差集
seta.subtract(setc) //seta独有的, 而setc没有的.
setc.subtract(seta)

//亦或 exclusiveOr, exclusiveOrInPlace
//seta.exclusiveOr(setc) //去除并集剩下的所有 //swift2
seta.symmetricDifference(setc) //返回交集的补集 //swift3

seta.union(["java", "android"]) //集合与数组一起操作求并集.

var setd: Set = ["swift"]
//setd.isSubsetOf(seta) //setd是否是seta的子集. //swift2
setd.isSubset(of: seta) //swift3

//setd.isStrictSubsetOf(seta) //setd是否是seta的真子集. //swift2
setd.isStrictSubset(of: seta) //swift3

//seta.isSupersetOf(setd) //seta是否是setd的超集. //swift2
seta.isSuperset(of: setd) //swift3

//seta.isStrictSupersetOf(setd) //seta是否是setd的真超集. //swift2
seta.isStrictSuperset(of: setd) //swift3

//seta.isDisjointWith(setb) //两个集合是否是相离的. seta与setb没有相同的一项技能. //swift2
seta.isDisjoint(with: setb) //swift3

//seta.isDisjointWith(setc) //swift2
seta.isDisjoint(with: setc) //swift3


/*** 选择合适的数据结构 **/
//数组: 有序
//集合: 无序, 唯一性, 提供集合操作, 快速查找.
//字典: 键-值数据对

//for-in 和更多




























































