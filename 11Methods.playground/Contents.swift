//: Playground - noun: a place where people can play

class Counter{
    var count = 0
    func increment(){
        count += 1
    }
    func increment(by amount: Int){
        count += amount
    }
    func reset(){
        count = 0
    }
}

let counrter = Counter()
counrter.increment()
counrter.increment(by: 5)
counrter.reset()

// self
struct Point{
    var x = 0.0,y = 0.0
    func isToRightOf(x:Double) -> Bool{
        return self.x > x
    }
}
let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToRightOf(x: 1.0){
    print("This point is to the right of the line where x == 1.0")
}

// 结构体默认不能再成员方法中修改变量的值
struct Point2{
    var x = 0.0,y=0.0
    mutating func moveBy(x deltaX: Double ,y deltaY: Double){
        x += deltaX
        y += deltaY
    }
}

var somePoint2 = Point2(x: 1.0, y: 1.0)
somePoint2.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(somePoint2.x), \(somePoint2.y))")


struct Point3{
    var x = 0.0,y = 0.0
    mutating func moveBy(deltaX: Double ,deltaY:Double){
        self = Point3(x: x + deltaX, y: y + deltaY)
    }
}

enum TriStateSwitch{
     case off,low,high
    mutating func next(){
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

var ovenLight = TriStateSwitch.low
ovenLight.next()
ovenLight.next()

// 类函数
class SomeClass{
    class func someTypeMethod(){
        print(#function)
    }
}
SomeClass.someTypeMethod()


struct LevelTracker{
    static var highestUnlocklevel = 1
    var currentLeven = 1
    
    static func unlock(_ level:Int){
        if level > highestUnlocklevel{
            highestUnlocklevel = level
        }
    }
    
    static func isUnlocked(_ level: Int) -> Bool{
        return level <= highestUnlocklevel
    }
    
    mutating func advance(to level:Int) -> Bool{
        if LevelTracker.isUnlocked(level) {
            currentLeven = level
            return true
        }else{
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Argyrios")
player.complete(level: 1)
print("highest unlocked level is now \(LevelTracker.highestUnlocklevel)")

player = Player(name: "Beto")
if player.tracker.advance(to: 6) {
    print("player is now on level 6")
} else {
    print("level 6 has not yet been unlocked")
}
