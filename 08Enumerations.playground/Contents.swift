//: Playground - noun: a place where people can play

enum CompassPoint{
    case north
    case south
    case east
    case west
}

enum Planet{
    case mercury,venus,earth,mars,jupiter,saturn,uranus,neptune
}

var directionToHead = CompassPoint.west
directionToHead = .east

// Swich
switch directionToHead{
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}

let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("Mostly Harmless")
default:
    print("Not a safe place for humans")
}

// 关联值
enum Barcode{
    case upc(Int,Int,Int,Int)
    case qrCode(String)
}
var profuctBarcode = Barcode.upc(8, 85909, 51226, 3)
profuctBarcode = .qrCode("ABVCXSSDF")
switch profuctBarcode {
case .upc(let numberSystem,let manufactu,let profuct,let check):
    print("UPC:\(numberSystem) \(manufactu) \(profuct) \(check)")
case .qrCode(let produceCode):
    print("QR Code:\(produceCode)")
}


profuctBarcode = Barcode.upc(8, 85909, 51226, 3)
switch profuctBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC : \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
    print("QR code: \(productCode).")
}

// Raw Value
enum ASCLLControlCharacter: Character{
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

// Implicitly Assigned Raw Values
enum PlanetRaw: Int{
    case mercury = 1,venus, earth, mars, jupiter, saturn, uranus, neptune
}

let earthsOrdewr = PlanetRaw.earth.rawValue
print(earthsOrdewr)

enum CompassPointRaw: String{
    case north, south, east, west
}
let sunsetDirection = CompassPointRaw.west.rawValue
print(sunsetDirection)

// init With Raw Value
let possiblePlanet = PlanetRaw(rawValue: 7)

let positionToFind = PlanetRaw(rawValue: 11)
if let somePlanet = positionToFind{
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
}else{
    print("Error")
}

// 递归枚举
enum ArithmeticExpression{
    case number(Int)
    indirect case addition(ArithmeticExpression,ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression,ArithmeticExpression)
}

indirect enum ArithmeticExpression2 {
    case number(Int)
    case addition(ArithmeticExpression2, ArithmeticExpression2)
    case multiplication(ArithmeticExpression2, ArithmeticExpression2)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case .number(let value):
        return value
    case let .addition(lhs, rhs):
        return evaluate(lhs) + evaluate(rhs)
    case let .multiplication(lhs, rhs):
        return evaluate(lhs) * evaluate(rhs)
    }
}

print(evaluate(product))


