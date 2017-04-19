//: Playground - noun: a place where people can play

import UIKit

//=====================================================//
//协议就像一个接口.
//协议 内可以写属性和方法, 
//但是方法是不能有大括号及实现, 
//具体做事的是由实现了协议的具体的类或结构来实现的.
//协议也是一种类型, 但是不能用协议去初始化 例: var pet:Pet = Pet() //error
//protocol Pet { //宠物
protocol Pet: class { //: class 说明协议只能被类尊守, 结构体不能实现了.
    //协议只规定了实现有一个属性name, 具体它是计算型属性 还是 存储型属性 协议并不关心. ***
    var name: String {get set} //属性必须用大括号指定属性是只读, 可写, 或者可读可写
    var birthPlace: String{get} //属性是不能有默认值
    func playWith()
    func fed(food: String) //参数是不能有默认值的

    //mutating只对结构体有用, 表明结构体尊守协议时这个函数是可以改变自己的.
    //mutating func changeName(newName: String)
    func changeName(newName: String)
}

//定义实现了协议Pet的结构体Dog
//struct Dog: Pet{
class Dog: Pet{
    /*
    private var myDoggyName: String //隐藏属性代表了name
    var name: String{
        get{
            return myDoggyName
        }
        set{
            myDoggyName = newValue
        }
    }
    */
    var name : String = "Puppy" //存储型属性, 在协议实现中属性可以有默认值.
    //let birthPlace: String = "Beijing" //因为birthPlace是只读的, 可以直接使用let声明.
    var birthPlace: String = "Beijing"
    
    func playWith() {
        print("Wong!")
    }
    
    //协议的实现函数中参数就可以有默认值了.
    func fed(food: String = "Bone"){
        if food == "Bone"{
            print("Happy")
        }
        else{
            print("I want a bone")
        }
    }
    
    //mutating func changeName(newName: String) {
    func changeName(newName: String) {
        self.name = newName;
    }
}

var myDog : Dog = Dog()
myDog.birthPlace = "ChaoYang"
myDog.birthPlace = "HaiDian" //虽然协议规定了birthPlace是只读的, 但是myDog是Dog类型的, 所以不受约束.

var pet: Pet = myDog //这说明Pet协议也是一种类型
//由于pet是协议Pet类型的, 且birthPlace是只读的属性, 所以不能被整改的.
//pet.birthPlace = "ChangPing" //error: birthPlace is a get-only property
pet.birthPlace

myDog.birthPlace = "BeiJing"
pet.birthPlace //由于pet和myDog指向了同一片内存区域, 所以myDog修改了只读属性, pet也被迫更改了.


//====协议和构造函数==============================//
protocol Pet2{
    var name: String{get set}
    
    //规定所有实现者<必须>有一个name参数的构造函数.
    init(name: String)
    
    func playWith()
    func fed()
}

class Animal{
    var type: String = "mammal"
}

//在Swift中当父类 要在 协议前面.
//Dog类的子类同时也尊守Pet2协议
class Dog2: Animal, Pet2{
    var name:String = "Puppy"
    
    //required标示子类<必须>重写的构造函数.
    //因为Dog2的子类也同时遵守Pet2协议, 那么就必须加上required关键字, 让Dog2的子类必须实现init(name)函数.
    required init(name:String){
        self.name = name
    }
    
    func playWith() {
        print("Wong")
    }
    
    func fed(){
        print("I love bones")
    }
}

class Bird: Animal{
    var name:String = "Little Little Bird"
    
    init(name:String){
        self.name = name
    }
}

//鹦鹉
class Parrot: Bird, Pet2{
    
    //init(name)构造函数即是Bird父类所需要的, 同时也是协议Pet2协议所必须实现的.
    //required是针对协议的, override是针对父类Bird的.
    required override init(name:String){
        super.init(name: name + " " + name)
    }
    
    func playWith() {
        print("Hello")
    }
    
    func fed(){
        print("Thank you!")
    }
}

///////////////////////////////////////////////////////////////
//完整的示例
///////////////////////////////////////////////////////////////
protocol Pet5{
    var name: String {get set}
}

protocol Flyable5{
    var flySpeed: Double {get}
    var flyHeight: Double {get}
}


class Animal5{
}

class Dog5: Animal5, Pet5{
    var name = "Puppy"
}

class Cat5: Animal5, Pet5{
    var name = "Kitten"
}

class Bird5: Animal5, Flyable5{
    
    var flySpeed: Double
    var flyHeight: Double
    
    init(flySpeed: Double, flyHeight: Double){
        self.flySpeed = flySpeed
        self.flyHeight = flyHeight
    }
}

class Parrot5: Bird5, Pet5{
    
    var name: String
    
    init(name: String, flySpeed: Double, flyHeight: Double){
        self.name = name + " " + name
        super.init(flySpeed: flySpeed, flyHeight: flyHeight)
    }
}

class Sparrow5: Bird5{
    
    var color = UIColor.gray
}


class Vehicle5{
    
}

class Plane5: Vehicle5, Flyable5{
    
    var model: String
    var flySpeed: Double
    var flyHeight: Double
    
    init(model: String, flySpeed: Double, flyHeight: Double){
        self.model = model
        self.flySpeed = flySpeed
        self.flyHeight = flyHeight
    }
}


var dog = Dog5()
var cat = Cat5()
var parrot = Parrot5(name: "hi", flySpeed: 10.0, flyHeight: 100.0)

let pets: [Pet5] = [dog, cat, parrot]
for pet in pets{
    print(pet.name)
}


var sparrow = Sparrow5(flySpeed: 15.0, flyHeight: 80.0)
var plane = Plane5(model: "Boeing 747", flySpeed: 200.0, flyHeight: 10_000.0)

let flyers: [Flyable5] = [parrot, sparrow, plane]
for flyer in flyers{
    print("Fly speed: " , flyer.flySpeed , "Fly Height: " , flyer.flyHeight)
}

/***
 * typealias 类型别名
 */
typealias Lenght = Double
extension Double{
    var km: Lenght{ return self * 1000.0}
    var m: Lenght{ return self}
    var cm: Lenght{ return self/100}
    var ft: Lenght{ return self/3.28084}
}

let runningDistance: Lenght = 3.54.km
runningDistance

typealias AudioSample = UInt64

protocol WeightCalculable{
    //associatedtype 和 typealias 语义是一样的
    associatedtype WeightType //给协议关联一个类型
    var weight: WeightType{ get }
}

class IPhone7: WeightCalculable{
    typealias WeightType = Double //声明协议关联的类型为Double
    
    var weight: WeightType{
        return 0.114
    }
}

class Ship: WeightCalculable{
    typealias WeightType = Int //声明协议关联的类型为Int
    
    let weight: WeightType
    
    init(weight: Int){
        self.weight = weight
    }
}

extension Int{
    typealias Weight = Int //给Int起一个别名
    var t: Weight{ return 1_000*self} //当使用t属性时, 返回Weight别名类型
}

let titanic = Ship(weight: 46_328.t)

//结构类型实现了协议Equatable后, 必须在结构体外紧跟着 协议的实现, 中间不能有其他语句
struct Record : Equatable, Comparable, CustomStringConvertible{
    var wins: Int //赢数
    var losses: Int //失败数
    
    var description: String{ //计算型属性
        return "WINS: " + String(wins) + ", LOSSES: " + String(losses)
    }
    
    var boolValue: Bool{
        return wins > losses //胜数大于败数, 则为赢了true.
    }
}

func ==(left: Record, right: Record) -> Bool{
    return left.wins == right.wins && left.losses == right.losses
}

func <(left: Record, right: Record) -> Bool{
    if(left.wins != right.wins){
        return left.wins < right.wins
    }
    return left.losses > right.losses
}

let recordA = Record(wins: 10, losses: 5)
let recordB = Record(wins: 10, losses: 5)
//当Record结构体实现了Equatable协议并实现了==操作, 会自动追加了!=操作
recordA != recordB
recordA > recordB
recordA >= recordB

var team1Record = Record(wins: 10, losses: 3)
var team2Record = Record(wins: 8, losses: 5)
var team3Record = Record(wins: 8, losses: 8)
var records = [team1Record, team2Record, team3Record]
//系统运行sort()函数时, 是期望其元素是可比较的, 即实现Comparable协议
//当Record结构体没有实现协议Comparable时, 此时sort()是会报错的
records.sort()

print(recordA) //调用了CustomStringConvertible协议

if recordA.boolValue{ //这是因为Record类型实现了BooleanType协议, 才可将Record做为一个bool类型使用
    print("Great!")
}

extension Int{
    public var boolValue: Bool{ //public是将系统内部功能对外公开
        return self != 0 //将Int不等于0时, 表示为true, 等于0时, 返回false
    }
}

var wins = 0
if !wins.boolValue{
    print("You never win!")
}







