//: Playground - noun: a place where people can play

func greet(person: String) -> String{
    let greeeting = "Hello," + person + " !"
    return greeeting
}

print(greet(person: "Anna"))
print(greet(person: "Brian"))

func greetAgain(person: String) -> String{
    return "Hello," + person + " Again!"
}
print(greetAgain(person: "Anna"))

func sayHelloWorld() -> String{
    return "Hello,World"
}
print(sayHelloWorld())

// 多个参数
func green(person: String,alreadyGreed:Bool) -> String{
    if alreadyGreed{
        return greetAgain(person: person)
    }else{
        return greet(person: person)
    }
}
print(green(person: "Time", alreadyGreed: true))

// 无返回值
func greent2(person: String){
    print("Hello,\(person)!")
}
greent2(person: "Dave")

func printAndCount(string: String) -> Int{
    print(string)
    return string.characters.count
}

func printAndCounting(string: String){
    let _ = printAndCount(string: string)
}

printAndCount(string: "Hello,World")
printAndCounting(string: "Hello,World")

func minMax(array:[Int]) -> (min: Int,max:Int){
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count]{
        if value < currentMin{
            currentMin = value
        }else if value > currentMax{
            currentMax = value
        }
    }
    return (currentMin,currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")

// Option
func minMaxSafe(array: [Int]) -> (min: Int,max: Int)?{
    if array.isEmpty {
        return nil
    }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count]{
        if value < currentMin{
            currentMin = value
        }else if value > currentMax{
            currentMax = value
        }
    }
    return (currentMin,currentMax)
}

if let bounds = minMaxSafe(array:  [8, -6, 2, 109, 3, 71]){
    print("min is \(bounds.min) and max is \(bounds.max)")
}

func someFunction(firstParmterName:Int,secondParmterName:Int){
    
}
someFunction(firstParmterName: 1, secondParmterName: 2)

func greet(person: String, from homeown: String) -> String{
    return "Hello \(person)! Glad you could vist from \(homeown)"
}
print(greet(person: "Bill", from: "Cupertino"))

func someFunction(_ first:Int ,second: Int){
    
}
someFunction(1, second: 2)

// 默认参数
func someFunction(paramterWithOutDefault: Int,parameterWithDefault: Int = 12){
    print(paramterWithOutDefault)
    print(parameterWithDefault)
}

someFunction(paramterWithOutDefault: 4)
someFunction(paramterWithOutDefault: 3, parameterWithDefault: 6)

/// 可变参数
func arithmeicMean(_ numbers: Double...) -> Double{
    var total: Double = 0
    for number in numbers{
        total += number
    }
    return total / Double(numbers.count)
}
arithmeicMean(1,2,3,4,5,6)
arithmeicMean(7,8,9,6)

// 可变参数
func swapTwoInts(_ a: inout Int , _ b: inout Int){
    let temp = a
    a = b
    b = temp
}

var AInt = 3
var BInt = 107
swap(&AInt, &BInt)
print("A:\(AInt) B:\(BInt)")

func addTwoInts(_ a: Int ,_ b: Int) -> Int{
    return a + b
}

func multiplyTwoInts(_ a:Int ,_ b: Int) -> Int{
    return a * b ;
}

func printHelloWorld(){
    print("Hello,World")
}

var mathFunction:(Int,Int)->Int = addTwoInts
print("Result:\(mathFunction(2,3))")

mathFunction = multiplyTwoInts
print("Result:\(mathFunction(2,3))")

func anotherMathResult(_ mathFunction:(Int,Int) -> Int,_ a:Int,_ b:Int){
    print(mathFunction(a,b))
}
anotherMathResult(addTwoInts, 3, 5)

func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStrpFunction(backward: Bool) -> (Int) ->Int {
    return backward ? stepBackward : stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStrpFunction(backward: currentValue>0)

print("Counting to zero:")
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")




