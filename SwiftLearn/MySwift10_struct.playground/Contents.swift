//: Playground - noun: a place where people can play
import UIKit

/*** 结构体 struct **/

struct Location{
    let latitude: Double //纬度 注意let修饰赋完初值后, 是不能改变的.
    var longitude: Double //径度 //可以改变
    //也可以在mutating修饰的func中 改变可变var的属性.
}
//结构体初始化时, 如果没有指定初值, 初始化时必须指定.
//let locationEmpty0 = Location() //error: Missing argument for parameter 'latitude' in call
let appleHeadQuarterLocation = Location(latitude: 37.3230, longitude: -122.0322)
var googleHeadQuarterLocation: Location = Location(latitude: 32.4220, longitude: -122.0841)

appleHeadQuarterLocation.latitude
googleHeadQuarterLocation.longitude

/*  *****  */
//如下error语句可以看出, let修饰的结构体属性不可改变
//appleHeadQuarterLocation.latitude = 0 //error: 'latitude' is a 'let' constant
//let修饰的结构体变量初始化完成后是不能改变其属性值的. 不管是否是用var修饰的属性, 因为结构体是值类型的.
//appleHeadQuarterLocation.longitude = 0 //error: 'appleHeadQuarterLocation' is a 'let' constant
//而用var修饰的结构体变量是可以修改其属性值的, 前提是属性必须用var修饰.
googleHeadQuarterLocation.longitude = 0
googleHeadQuarterLocation.longitude
googleHeadQuarterLocation = appleHeadQuarterLocation

struct Place{
    let location: Location
    var name: String
}

var googleHeadQuarter = Place(location: googleHeadQuarterLocation, name: "Google")
//googleHeadQuarter.location.latitude = 0 //error because latitude was be let as constant
//***** 注:当用let修饰Place为结构体常量时, 虽然Place的属性name是var修饰的变量, 但是仍然不能改变其值, 但是类却可以.
let place = Place(location: googleHeadQuarterLocation, name: "kangqiao")
//place.name = "KQ" //Cannot assign to property: 'place' is a 'let' constant

//let loaction = Location(longitude: -122.0322, latitude: 37.3230)//初始化结构体时, 属性位置不可改变.
let location = Location(latitude: 37.0322, longitude: -122.0322)

struct Location2{
    var latitude: Double = 0
    var longitude: Double = 0
}

let locationEmpty = Location2() //当结构体属性设有初值时, 默认仍会有一个空的构造函数.
//let location2 = Location2(latitude: 32) //struc结构体属性虽然有初值, 但是在声明使用时, 仍然不可省略.
let location2 = Location2(latitude: 37.3230, longitude: -122.0322)

struct Location3{
    var latitude: Double = 0
    var longitude: Double = 0
    var placeName: String?
    //init本质上是一个构造函数, 不能写func
    //一旦有init构造函数, 原先默认的就不起作用了, 那么一般我们会手动创建一个原先的构造函数.
    //init构造函数虽然是func, 但是第一个参数是不可以省略的, 除非设置外变量为_下划线.
    init(coordinateString: String){
        let commaIndex = coordinateString.characters.index(of: ",")
        let firstElement = coordinateString.substring(to: commaIndex!)
        let secondElement = coordinateString.substring(from: coordinateString.index(after: commaIndex!))
        
        latitude = Double(firstElement) ?? 0.00
        longitude = Double(secondElement) ?? 0.00
    }
    
    //手写下默认的构造函数.
    init(latitude: Double, longitude2: Double){
        self.latitude = latitude
        longitude = longitude2 //名字不同时self可以省略. 建议加上, 明确下.
    }
}

let location3 = Location3(coordinateString: "37.3230,-122.0322")

let a = Set<Int>([1,2,3,4])
let b = Int()
let c = Int(1.6) //1
let d = [Int](repeating:0, count:3)


//可失败的构造函数
//在结构体和枚举中定义方法
struct Location4{
    var latitude: Double = 0
    var longitude: Double = 0
    //init本质上是一个构造函数, 不能写func
    //一旦有init构造函数, 原先默认的就不起作用了, 那么一般我们会手动创建一个原先的构造函数.
    //init构造函数虽然是func, 但是第一个参数是不可以省略的, 除非设置外变量为_下划线.
    //使用Failable-initializer init?()
    init?(coordinateString: String){
        //        guard let commaIndex = coordinateString.rangeOfString(",")?.startIndex else{
        //            return nil
        //        }
        //
        //        guard let firstElement = Double(coordinateString.substringToIndex(commaIndex)) else{
        //            return nil
        //        }
        //
        //        guard let secondElement = Double(coordinateString.substringFromIndex(commaIndex.successor())) else{
        //            return nil
        //        }
        
        //guard的混合多个使用.
        guard
            let commaIndex = coordinateString.characters.index(of: ","),
            let firstElement = Double(coordinateString.substring(to: commaIndex)),
            let secondElement = Double(coordinateString.substring(from: coordinateString.index(after: commaIndex)))
            else{
                return nil
        }
        
        //调用自己的另一个初始化函数.
        self.init(latitude: firstElement, longitude: secondElement)
        
        //self.latitude = firstElement
        //longitude = secondElement //名字不同时self可以省略. 建议加上, 明确下.
    }
    
    //手写下默认的构造函数.
    init(latitude: Double, longitude lt2: Double){
        self.latitude = latitude
        longitude = lt2 //名字不同时self可以省略. 建议加上, 明确下.
    }
    
    //结构体和类中定义的函数我们一般叫方法
    func printLocation(){
        print("The Location is \(self.longitude), \(self.longitude)")
    }
    
    func isNorth() -> Bool{ //返回是否在北半球
        return self.latitude > 0
    }
    
    func isSouth() -> Bool{ //调用结构体内部的方法.
        return !self.isNorth() //self可以省略.
    }
    
    //计算两个位置的距离
    func distanceTo(location: Location4) -> Double{
        return sqrt(pow(self.latitude - location.latitude, 2) + pow(self.longitude - location.longitude, 2))
    }
}

//如果用了init?可失败的初始化函数初始化时, 返回值就可能为nil, 所以返回的是Location4? 可选型.
let appleHeadQuarterLocation4 = Location4(coordinateString: "37.3230,-122.0322") //Location4?
appleHeadQuarterLocation4!.printLocation()
appleHeadQuarterLocation4!.isNorth()
appleHeadQuarterLocation4!.isSouth()

//而当使用init初始化时, 不会返回nil, 所以返回的Location4不是可选型
let googleHeadQuarterLocation4 = Location4(latitude: 37.4220, longitude: -122.0841)
appleHeadQuarterLocation4!.distanceTo(location: googleHeadQuarterLocation4)


//Swift中 枚举也可以有方法
enum Shape{
    case Square(side: Double)
    case Rectangle(width: Double, height: Double)
    case Circle(centerx: Double, centery: Double, radius: Double)
    case Point
    
    func area() -> Double{ //enum Shape 的求面积方法
        switch self{
        case let .Square(side):
            return side * side
        case let .Rectangle(width, height):
            return width * height
        case let .Circle( _, _, r):
            return M_PI * r * r
        case .Point:
            return 0
        }
    }
}

let square = Shape.Square(side: 10)
let rectangle = Shape.Rectangle(width: 20, height: 30)
let circle = Shape.Circle(centerx: 0, centery: 0, radius: 15)
let point = Shape.Point

square.area()
rectangle.area()
circle.area()
point.area()

//结构体和枚举本身是值类型 ***
//Value Type -> 编译器在处理时是把它当作一个值来处理的, 对应的是引用处理,
//值类型最大的特点是赋值即是拷贝
struct Point{
    var x = 0
    var y = 0
}

var p1 = Point()
var p2 = p1
p2.x += 1
p2.x //1
p1.x //0 p1并不因为p2的修改而改变.
//*** 枚举型也是值类型.
var square1 = Shape.Square(side: 2.0)
var square2 = square1

square2 = Shape.Square(side: 5.0)
square2
square1

//到处都使用的结构体
//结构体在Swift中占据了非常重要的地位
//Swfit中 Array, Dictionary, Set 集合 都是结构体!
//Int, Float, Double, Bool, String 都是结构体!
//它们都属于值类型.
var aInt : Int = 1
aInt.distance(to: 100) //Int结构体类型的方法distanceTo
//按住command后点击Int类型即可看到Swift对于Int结构体类型的定义如下:
//public struct Int : SignedIntegerType, Comparable, Equatable {
var arr = [1, 2, 3]
arr.count
arr.append(4) //结构体的方法改变结构体中的属性值.
Int.max //结构体的属性
