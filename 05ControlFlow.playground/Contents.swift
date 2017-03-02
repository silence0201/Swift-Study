//: Playground - noun: a place where people can play

// 循环
for index in 1...5{
    print(index)
}

let base = 3
let power = 10
var answer = 1
for _ in 1...power{
    answer *= base
}

let names = ["Anna","Alex","Brian","Jack"]
for name in names{
    print("Hello,\(name)")
}

// 字典
let numberofLegs = ["spider":8,"cat":4]
for (animalName,legCount ) in numberofLegs{
    print("\(animalName)--\(legCount)")
}

// While 循环
let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare+1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var square = 0
var diceRoll = 0
while square < finalSquare {
    diceRoll += 1
    if diceRoll == 7{
        diceRoll = 1
    }
    square += diceRoll
    if square < board.count {
        square += board[square]
    }
}
print("Over")

square = 0
diceRoll = 0
repeat{
    square += board[square]
    diceRoll += 1
    if diceRoll == 7 {
        diceRoll = 1
    }
    square += diceRoll
}while square < finalSquare
print("Over")

// 条件
var temper = 30
if temper<=32{
    print("YES")
}

temper = 90
if temper <= 32 {
    print("It's very cold. Consider wearing a scarf")
} else if temper >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
    print("It's not that cold. wear a t-shirt.")
}

// Switch 
let someCharacter: Character = "e"
switch someCharacter {
    case "a","e","i":
        print(someCharacter)
    default:
        print("Comnm \(someCharacter)")
}

let another: Character = "a"
switch another {
    case "A":
        print(another)
    default:
        print("Other:\(another)")
}

let approximateCount = 62
let countedThings = "moons orbitiy Saturn"
var natureCount: String
switch approximateCount{
    case 0:
        natureCount = "no"
    case 1..<5 :
        natureCount = "a few"
    case 5..<12:
        natureCount = "several"
    case 12..<100:
        natureCount = "A lot"
    default:
        natureCount = "Other"
}

print("There are \(natureCount) \(countedThings)")

// 元组
let somePoint = (1,1)
switch somePoint{
case (0,0):
    print("(0,0)")
case (_,0):
    print("X")
case (0,_):
    print("Y")
case(-2...2,-2...2):
    print("Box")
default:
    print("Others")
}


let antoPoint = (2,0)
switch antoPoint {
case (let x,0):
    print("在x轴上:\(x)")
case (0,let y):
    print("在y轴上:\(y)")
default:
    print("Others")
}

// where
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}

let puzzleInput = "great minds think alike"
var puzzleOutput = ""
for charac in puzzleInput.characters{
    switch charac {
    case "a","e","i","o","u":
        continue
    default:
        puzzleOutput.append(charac)
    }
}
puzzleOutput

let numberSymbol: Character = "三"
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break
}
if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value could not be found for \(numberSymbol).")
}

// Fallthrough
let intergerToDesc = 5
var description = "The number \(intergerToDesc) is"
switch intergerToDesc {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
case 1:
    description += " Not 1"
default:
    description += " an integer."
}
print(description)

// Labelled Statements
board = [Int](repeating: 0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
square = 0
diceRoll = 0

gameLoop: while square != finalSquare{
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1}
    switch square + diceRoll {
    case finalSquare:
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        continue gameLoop
    default:
        square += diceRoll
        square += board[square]
    }
}

print("Over")

func greet(person:[String: String]){
    guard let name = person["name"] else{
        return
    }
    
    print("Hello \(name)") ;
    
    guard let location = person["loaction"] else{
        print("Message")
        return
    }
    print("\(location)")
}

greet(person: [:])
greet(person: ["name": "John"])
greet(person: ["name":"Jane", "location": "Cupertino"])

// 检测API可用性
if #available(iOS 9,OSX 10.12, *){
    print("使用ios9以上的APIS")
}else{
    print("不能使用ios以上的APIs")
}
