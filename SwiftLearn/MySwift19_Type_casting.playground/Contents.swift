//: Playground - noun: a place where people can play

import UIKit

//Swift运行时的类型检查 is, 类与类之间的类型转换 as.
class MediaItem{
    var name: String
    init(name: String){
        self.name = name
    }
}

class Movie: MediaItem{
    var genre: String //类型
    init(name: String, genre: String){
        self.genre = genre
        super.init(name: name)
    }
}

class Music: MediaItem{
    var artist: String //演唱者
    init(name: String, artistName: String){
        self.artist = artistName
        super.init(name: name)
    }
}

class Game: MediaItem{
    var developer: String //开发者
    init(name: String, developer: String){
        self.developer = developer
        super.init(name: name)
    }
}


let library: [MediaItem] = [
    Movie(name: "Zootopia", genre: "Animation"),
    Music(name: "Hello", artistName: "Adele"),
    Game(name: "LIMBO", developer: "Playdead"),
    Music(name: "See you agian", artistName: "Wiz Khalifa"),
    Game(name: "The Bridge", developer: "The Quantum Astrophysicists Guild")
]

//类型检查 关键字 is
var musicCount = 0
var movieCount = 0
var gameCount = 0
for mediaItem in library{
    if mediaItem is Movie{
        movieCount += 1
    }
    else if mediaItem is Music{
        musicCount += 1
    }
    else if mediaItem is Game{
        gameCount += 1
    }
}

//类型转换 关键字 as
let item0 = library[0] as? Movie //Movie? 尝试进行类型转换
let item00 = library[0] as? Music //nil
let item000 = library[0] as! Movie //已经确认是Movie类型.
//let item0000 = library[0] as! Music //如果确认失败, 会产生重大错误, 程序中止.

for mediaItem in library{
    if let movie = mediaItem as? Movie{ //尝试进行类型转换并解包使用
        print("Movie:", movie.name, "Genre:", movie.genre)
    }
    else if let music = mediaItem as? Music{
        print("Music:", music.name, "Artist:", music.artist)
    }
    else if let game = mediaItem as? Game{
        print("Game:", game.name, "Developer(s):", game.developer)
    }
}

//类型判断 在协议中的应用 判断类型是否遵守了协议
protocol Shape{ //图形
    var name: String{get}
}

protocol HasArea{ //面积
    func area() -> Double
}

struct Point: Shape{
    let name: String = "point"
    var x: Double
    var y: Double
}

struct Rectangle: Shape, HasArea{
    let name: String = "rectangle"
    var origin: Point
    var width: Double
    var height: Double
    
    func area() -> Double{
        return width * height
    }
}

struct Circle: Shape, HasArea{
    let name = "circle"
    var center: Point
    var radius: Double
    
    func area() -> Double{
        return M_PI * radius * radius
    }
}

struct Line: Shape{
    let name = "line"
    var a: Point
    var b: Point
}

let shapes:[Shape] = [
    Rectangle(origin: Point(x:0.0,y:0.0), width: 3.0, height: 4.0),
    Point(x: 0.0, y: 0.0),
    Circle(center: Point(x:0.0,y:0.0), radius: 1.0),
    Line(a: Point(x:1.0,y:1.0), b: Point(x:5.0,y:5.0))
]

for shape in shapes{
    if shape is HasArea{
        print("\(shape.name) has area.")
    }
    else{
        print("\(shape.name) has no area.")
    }
}

print("==========")

for shape in shapes{
    if let areaShape = shape as? HasArea{
        print("The area of \(shape.name) is \(areaShape.area()).")
    }
    else{
        print("\(shape.name) has no area.")
    }
}

//NSObject, AnyObject, Any
class Person{
    var name: String
    init(name: String){
        self.name = name
    }
}

var objects1 = [
    CGFloat(3.1415926),
    "imooc",
    UIColor.blue,
    NSDate(),
    Int(32),
    Array<Int>([1,2,3])
] as [Any]
// a1 为NSObject
let a1 = objects1[0]

var objects2 = [
    CGFloat(3.1415926),
    "imooc",
    UIColor.blue,
    NSDate(),
    Int(32),
    Array<Int>([1,2,3]),
    Person(name: "liuyubobobo")
] as [Any]

// a2 为AnyObject
let a2 = objects2[0]
//AnyObject比NSObject还要高一层
//NSObject是OC语言中所有类的父类. AnyObject脱离了面向对象中继承树这个概念, 
//任何的一个对象, 任何的一个Object都可以表述成AnyObject. 
//实际上在底层AnyObject和OC语言中的ID概念是对应的. 
//(简单来说ID就相当于C/C++中void * 相对应, 就相当于一个指针, 这个指针没有类型, 指向了这片内存空间. 
//只要这个内存空间存的是一个对象, 我们就说这是一个AnyObject.


var objects3: [Any] = [
    CGFloat(3.1415926),
    "imooc",
    UIColor.blue,
    NSDate(),
    Int(32),
    Array<Int>([1,2,3]),
    Person(name: "liuyubobobo")
]

//发生error, 因为函数不是一个AnyObject.
//objects3.append( {(a:Int) -> Int in
//    return a*a
//})


var objects4: [Any] = [
    CGFloat(3.1415926),
    "imooc",
    UIColor.blue,
    NSDate(),
    Int(32),
    Array<Int>([1,2,3]),
    Person(name: "liuyubobobo")
]

//没有错误, Any比AnyObject的范围还要广, Any不仅可以包含任何的对象, 还可以包含函数这样的逻辑.
objects4.append( { (a:Int) -> Int in
    return a*a} )























