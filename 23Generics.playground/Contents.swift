//: Playground - noun: a place where people can play

func swapTwoInts(_ a: inout Int, _ b:inout Int){
    let temp = a
    a = b
    b = temp
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

func swapTwoStrings(_ a: inout String, _ b: inout String) {
    let temporaryA = a
    a = b
    b = temporaryA
}


// 泛型
func swapTwoValue<T>(_ a: inout T, _ b: inout T){
    let temp = a
    a = b
    b = temp
}

swapTwoValue(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

var someString = "hello"
var anotherString = "world"
swapTwoValue(&someString, &anotherString)
print("someString is now \(someString), and anotherString is now \(anotherString)")

// 不带泛型的结构体
struct IntStack {
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

// 带泛型的结构体
struct Stack<Element>{
    var items = [Element]()
    mutating func push(_ item: Element){
        items.append(item)
    }
    mutating func pop() -> Element{
        return items.removeLast()
    }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")
print(stackOfStrings)

let fromTheTop = stackOfStrings.pop()

extension Stack{
    var topItem: Element?{
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

if let topItem = stackOfStrings.topItem{
    print("The top item on the stack is \(topItem).")
}

func findIndex(ofString valueToFind: String, in array: [String]) -> Int?{
    for (index,value) in array.enumerated(){
        if value == valueToFind{
            return index
        }
    }
    return nil
}

let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findIndex(ofString: "llama", in: strings) {
    print("The index of llama is \(foundIndex)")
}

func findIndex<T:Equatable>(of valueToFind: T,in array:[T]) -> Int?{
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let doubleIndex = findIndex(of: 9.3, in: [3.14159, 0.1, 0.25])
let stringIndex = findIndex(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"])

// 类型关联
protocol Container{
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int{get}
    subscript(i: Int) -> Item {get}
}

struct IntStack2: Container {
    // original IntStack implementation
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    // conformance to the Container protocol
    typealias Item = Int
    mutating func append(_ item: Int) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}

struct Stack2<Element>: Container {
    // original Stack<T> implementation
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    // conformance to the Container protocol
    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}

extension Array: Container {}

func allItemsMatch<C1: Container, C2: Container>(_ someContainer: C1, _ anotherContainer: C2) -> Bool
    where C1.Item == C2.Item, C1.Item: Equatable {
        
        // check that both containers contain the same number of items
        if someContainer.count != anotherContainer.count {
            return false
        }
        
        // check each pair of items it see if they are equivilent
        for i in 0..<someContainer.count {
            if someContainer[i] != anotherContainer[i] {
                return false
            }
        }
        
        // all items match, so return true
        return true
}
var stackOfStrings2 = Stack2<String>()
stackOfStrings2.push("uno")
stackOfStrings2.push("dos")
stackOfStrings2.push("tres")

var arrayOfStrings = ["uno", "dos", "tres"]

if allItemsMatch(stackOfStrings2, arrayOfStrings){
    print("Match")
}else{
    print("Not all Match")
}

extension Stack2 where Element:Equatable{
    func isTop(_ item: Element) -> Bool{
        guard let topItem = items.last else{
            return false
        }
        return topItem == item
    }
}

if stackOfStrings2.isTop("tres") {
    print("Top element is tres.")
} else {
    print("Top element is something else.")
}

struct NotEquatable { }
var notEquatableStack = Stack2<NotEquatable>()
let notEquatableValue = NotEquatable()
notEquatableStack.push(notEquatableValue)

