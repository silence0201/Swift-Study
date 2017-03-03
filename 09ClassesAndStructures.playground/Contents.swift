//: Playground - noun: a place where people can play

class SomeClass{
    
}

struct SomeStruct{
    
}

struct Resolution{
    var width = 0
    var height = 0
}

class VideoMode{
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let someRosolution = Resolution()
let someVideoMode = VideoMode()
print("width rosolution:\(someRosolution.width)")
print("Width vide:\(someVideoMode.resolution.width)")

someVideoMode.resolution.width = 12800
print("Width vide:\(someVideoMode.resolution.width)")

let vga = Resolution(width: 640, height: 480)

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
print("cinema is now \(cinema.width) pixels wide")
print("hd is still \(hd.width) pixels wide")

enum CompassPoint{
    case noth,south,east,west
}

var currentDirection = CompassPoint.west
let rememberDir = currentDirection
if rememberDir == .west {
    print("The remembered direction is still .west")
}

let tenEioghty = VideoMode()
tenEioghty.resolution = hd
tenEioghty.interlaced = true
tenEioghty.name = "1080i"
tenEioghty.frameRate = 25.0

let alsoTenEighty = tenEioghty
alsoTenEighty.frameRate = 30.0
print("TenEighj:\( tenEioghty.frameRate)")

if tenEioghty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}
