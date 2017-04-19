//: Playground - noun: a place where people can play

import UIKit

struct Point{
    var x = 0.0
    var y = 0.0
}

struct Size{
    var width = 0.0
    var height = 0.0
}

class Rectangle{
    
    var origin = Point()
    var size = Size()
    
    init( origin: Point , size: Size ){
        self.origin = origin
        self.size   = size
    }
}


// extension 中放入新的方法
extension Rectangle{
    
    // 如果是struct，就需要使用mutating关键字
    func translate(x: Double, y: Double){
        
        self.origin.x += x
        self.origin.y += y
    }
}


let rect = Rectangle(origin: Point(), size: Size(width: 4, height: 3))
rect.translate(x: 10, y: 10)
rect


// extension 中放入新的属性
extension Rectangle{

    // extension中只能放入计算型属性 ***
    var center: Point{
        
        get{
            let centerX = origin.x + size.width/2
            let centerY = origin.y + size.height/2
            return Point(x: centerX, y: centerY)
        }
        
        set(newCenter){
            origin.x = newCenter.x - size.width/2
            origin.y = newCenter.y - size.height/2
        }
    }
    
    var area: Double{
        return size.width * size.height
    }
    
    var perimeter: Double{
        return 2*(size.width + size.height)
    }
    
    
    // 可以在extension中根据计算性属性放入新的构造函数
    // extension中只能放入convenience的构造函数 ****
    convenience init(center: Point, size: Size){
        let originX = center.x - size.width/2
        let originY = center.y - size.height/2
        //self.origin = Point(x: originX, y: originY)
        //self.size = size
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}


rect.area
rect.perimeter
rect

let rect2 = Rectangle(center: Point(), size: Size(width: 6, height: 8))
rect2

//Nested Type 嵌套类型

class UI{
    
    //在UI类中嵌套枚举类型
    enum Theme{
        case DayMode
        case NightMode
    }
    
    var fontColor: UIColor!
    var backgroundColor: UIColor!
    var themeMode: Theme = .DayMode{ //属性观察器
        didSet{
            self.changeTheme(themeMode: self.themeMode)
        }
    }
    
    init(){
        self.themeMode = .DayMode
        self.changeTheme(themeMode: self.themeMode)
        
    }
    
    init(themeMode: Theme){
        self.themeMode = themeMode
        self.changeTheme(themeMode: themeMode)
    }
    
    func changeTheme( themeMode: Theme ){
        switch(themeMode){
        case .DayMode:
            fontColor = UIColor.black
            backgroundColor = UIColor.white
        case .NightMode:
            fontColor = UIColor.white
            backgroundColor = UIColor.black
        }
    }
}


let ui = UI()
ui.themeMode //Declaration: var themeMode: UI.Theme { get set }
ui.fontColor
ui.backgroundColor

ui.themeMode = UI.Theme.NightMode //或者直接使用 .NightMode
ui.themeMode
ui.fontColor
ui.backgroundColor


// 以前就见过Nest Type
// String.Index
let str = "Hello World"
str.startIndex //Declaration: var startIndex: Index { get }
let index2 : String.Index = str.startIndex
let index = str.index(index2, offsetBy: 5)
str.substring(to: index)

//在扩展中嵌套类型
// extension 中放入 Nested Type, Methods 和 subscript
extension Rectangle{
    
    // extension 中放入 Nested Type
    enum Vertex: Int{ //rawValue类型是Int类型
        case LeftTop
        case RightTop
        case RightBottom
        case LeftBottom
    }
    
    func pointAtVertex( v: Vertex ) -> Point{
        
        switch v{
        case .LeftTop:
            return origin
        case .RightTop:
            return Point(x: origin.x + size.width, y: origin.y )
        case .RightBottom:
            return Point(x: origin.x + size.width, y: origin.y + size.height )
        case .LeftBottom:
            return Point(x: origin.x, y: origin.y + size.height )
        }
    }
    
    // extension 中放入 subscript下标
    subscript(index: Int) -> Point{
        assert( index >= 0 && index < 4 , "Index in Rectange Out of Range.")
        return pointAtVertex(v: Vertex(rawValue: index)!)
    }
}


let rect3 = Rectangle(origin: Point(), size: Size(width: 4, height: 3))
rect3.pointAtVertex(v: .RightBottom)

rect3[0]
rect3[1]
rect3[2]
rect3[3]

/***
 * 扩展标准库
 */

extension Int{
    var square: Int{ //平方
        get{
            return self * self
        }
    }
    
    var cube: Int{ //立方计算型属性
        return self * self * self
    }
    
    //前闭后开
    func inRange(closedLeft begin: Int, openedRight end: Int) -> Bool{
        return self >= begin && self < end
    }
    
    func repetitions(task: () -> Void){
        for _ in 0 ..< self{
            task()
        }
    }
    
    func stride(to end2: Int, by step: Int, task: (Int) -> Void){
        /*for x in stride(from: self, to: end2, by: step) {
            task(x)
        }*/
        var from = self
        while (step > 0 && from < end2) || (step < 0 && from > end2){
            task(from)
            from += step
        }
    }
}
let num = 8
num * num
num.square
num.cube

let index3 = 12
index3.inRange(closedLeft: 0, openedRight: 20)

num.repetitions(){
    print("Hello!")
}

//Swift2.2已经不建议使用这样的C-Style的循环
//for var i = 0; i < num; i += 2{}
//修改为
/*
 //swift2
 for i in 2.stride(to: num, by: 2){ // 从2到num //swift2
    print(i, terminator: " ")
}*/
//swift3
for i in stride(from: 2, to: num, by: 2){
    print(i, terminator: " ")
}

print()
/*
 //swift2
 for i in 20.stride(through: num, by: -3){ //从20到num, 递减3, through代表num(包括).
    print(i, terminator: " ")
}*/
//swift3
for i in stride(from: 20, through: num, by: -3){
    print(i, terminator: " ")
}

print("\n====扩展的stride函数===")
num.stride(to: 2, by: -2){ index in
    print(index.square)
}

//=======================================================//
/***
  * 泛型 Generic
  */
//交换函数
func swapTwoThings<T>( a: inout T, _ b: inout T){
    (a,b) = (b,a)
}
var hello = "Hello"
var bye = "Bye"
swapTwoThings(a: &hello, &bye)
hello
bye

//使用系统的交换函数.
swap(&hello, &bye)
hello
bye

struct Stack<T> {
    var items = [T]()
    
    func isEmpty() -> Bool{
        return items.count == 0
    }
    
    mutating func push(item: T){
        items.append(item)
    }
    
    mutating func pop() -> T?{
        guard !self.isEmpty() else{
            return nil
        }
        
        return items.removeLast()
    }
}

extension Stack{
    func top() -> T?{
        return items.last
    }
}

var s = Stack<Int>()
s.push(item: 1)
s.push(item: 2)

s.pop()

var ss = Stack<String>()
s.top()

struct Pair<K, V>{
    var a: K
    var b: V
}
var pair = Pair<Int, String>(a: 0, b: "Hello")
pair







