//: Playground - noun: a place where people can play


// 结构体属性
struct FixedLengthRange{
    var firstValue: Int
    let length: Int
}
var rangeOfThreeitems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeitems.firstValue = 6

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)

class DataImporter{
    var fileName = "data.txt"
}

class DataManager{
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()
manager.data += ["Some data"]
manager.data += ["More Data"]
print(manager.importer.fileName)

struct Point{
    var x = 0.0 ,y = 0.0
}

struct Size{
    var width = 0.0, height = 0.0
}

// get / set
struct Rect{
    var origin = Point()
    var size = Size()
    var center: Point{
        get{
            let centerX = origin.x + size.width / 2
            let centerY = origin.y + size.height / 2
            return Point(x: centerX, y: centerY)
        }
        set(newCenter){
            origin.x = newCenter.x - size.width/2
            origin.y = newCenter.y - size.height/2
        }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
print(initialSquareCenter)

// 设置只读属性
struct Cuboid{
    var width = 0.0,height = 0.0 ,depth = 0.0
    var volum: Double{
        return width * height * depth
    }
}
let fouBuFi = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("Volum:\(fouBuFi.volum)")

// 监听属性
class StroCounter{
    var totalStep: Int = 0{
        willSet(newTotalStep){
            print("New Value:\(newTotalStep)")
        }
        didSet{
            if totalStep > oldValue {
                print("Added \(totalStep - oldValue) steps")
            }
        }
    }
}

let stepCounter = StroCounter()
stepCounter.totalStep = 200
stepCounter.totalStep = 360
stepCounter.totalStep = 896

// 类型属性
struct SomeStructe{
    static var storedTypeProperty = "Some Value"
    static var computedTypeProperty: Int{
        return 1
    }
}

enum SomeEnumeration{
    static var stardTypeProperty = "Some Value"
    static var computedTypeProperty: Int{
        return 6
    }
}

class SomeClass{
    static var stordTypeProperty = "Some Valeu"
    static var computrfTypeProperty: Int{
        return 27
    }
    class var overrideableCom:Int{
        return 107
    }
}

print(SomeStructe.storedTypeProperty)
SomeStructe.storedTypeProperty = "Another Value"
print(SomeStructe.storedTypeProperty)
print(SomeEnumeration.computedTypeProperty)
print(SomeStructe.computedTypeProperty)


struct AudioChannel{
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                // cap the new audio level to the threshold level
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                // store this as the new overall maximum input level
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()
leftChannel.currentLevel = 7
print(leftChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)
rightChannel.currentLevel = 11
print(rightChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)
