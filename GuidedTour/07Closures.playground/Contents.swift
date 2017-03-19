//: Playground - noun: a place where people can play

// 函数闭包
let name = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backward(s1: String ,s2: String) -> Bool{
    return s1 > s2
}
var reverseNames = name.sorted(by: backward)
print(reverseNames)

reverseNames = name.sorted(by: { (s1:String, s2:String) -> Bool in return s1 > s2})
print(reverseNames)

reverseNames = name.sorted(by: {s1,s2 in return s1 > s2})
print(reverseNames)

reverseNames = name.sorted(by: {s1,s2 in s1 > s2})
print(reverseNames)

reverseNames = name.sorted(by: {$0 > $1})
print(reverseNames)

reverseNames = name.sorted(by: >)
print(reverseNames)

// 参数为闭包
func someFunctionThatTakeAClosure(closure: () -> ()){
    closure()
    print(closure)
}

someFunctionThatTakeAClosure() {
    print("Test")
}

someFunctionThatTakeAClosure(closure: { print("Demo") })

let digitNames = [
    0: "Zero", 1: "One", 2: "Two", 3: "Three", 4:"Four",
    5: "Five", 6:"Six", 7: "Seven", 8: "Eight", 9: "Nine"
]

let numbers = [16,58,510]

let strings = numbers.map { (number:Int) -> String in
    var number = number
    var output = ""
    repeat{
        output = digitNames[number % 10]! + output
        number /= 10
    }while number > 0
    return output
}
print(strings)

// 获取外部变量
func makeIncrementer(forIncrement amount: Int) -> () -> Int{
    var runingTotal = 0
    func incrementer() -> Int{
        runingTotal += amount
        return runingTotal
    }
    return incrementer
}

let incrementsByTen = makeIncrementer(forIncrement: 10)
incrementsByTen()
incrementsByTen()
incrementsByTen()

let incrementsBySeven = makeIncrementer(forIncrement: 7)
incrementsBySeven()
incrementsBySeven()

let alsoIncrementByTen = incrementsByTen
alsoIncrementByTen()

var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void ){
    completionHandlers.append(completionHandler)   // 不添加逃逸标志会报错
}

func someFunctionWithNoneEscapingCloursure(closure: () -> Void){
    closure()
}

class SomeClass{
    var x = 10
    func doSomething(){
        someFunctionWithEscapingClosure {
            self.x = 100
        }
        someFunctionWithNoneEscapingCloursure {
            x = 200
        }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)

completionHandlers.first!()
print(instance.x)

// 自动闭包
var customerInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customerInLine.count)

let customerProvider = { customerInLine.remove(at: 0) }
print(customerInLine.count)

print("Now serving \(customerProvider())")
print(customerInLine.count)

func serve(customer customerProvider:() -> String){
    print("Now serving \(customerProvider())")
}
serve(customer: { customerInLine.remove(at: 0) })
print(customerInLine.count)

func serve(custom customProvider: @autoclosure () -> String){
    print("Now serving \(customerProvider())")
}
serve(custom: customerInLine.remove(at: 0))
print(customerInLine.count)

customerInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
var customerProvifers:[() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String){
    customerProvifers.append(customerProvider)
}

collectCustomerProviders(customerInLine.remove(at: 0))
collectCustomerProviders(customerInLine.remove(at: 0))

print("Collected \(customerProvifers.count) closures.")
for customerProvider in customerProvifers {
    print("Now serving \(customerProvider())!")
}

