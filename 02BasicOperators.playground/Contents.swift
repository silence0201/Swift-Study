//: Playground - noun: a place where people can play

// 赋值
let a = 10
var b = 5
b = a

let (x,y) = (1,2)

1+2
5-3
2*3
10.0 / 2.5

"hello " + "world"

let dog: Character = "🐶"
let cow: Character = "🐮"
let dogcow = "🐶" + "🐮"

9 % 4
-9 % 4
9 % -4
-9 % -4

let three = 3
let minusThree = -three
let alsoMinusSix = +minusThree

var aaa = 1
aaa += 2

// 比较运算符
1 == 1
2 != 1
2 > 1
1 < 2
1 >= 1
2 <= 1

let name = "world"
if name == "world"{
    print("Hello World")
}else{
    print("I am Sorry \(name)")
}

let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)

for i in 0...5{
    print("\(i)")
}

let names = ["Anna","Alex","Btian","Jack"]
let count = names.count
for i in 0..<count{
    print("index:\(i) name:\(names[i])")
}

let allowEntry = false
if !allowEntry{
    print("Access refuse")
}

let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan{
    print("Welcome")
}else{
    print("Access refuse")
}

let hasDoorKey = false
let knowOverridePassword = true
if hasDoorKey || knowOverridePassword {
    print("Welcome")
}





