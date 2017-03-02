//: Playground - noun: a place where people can play

// Arrays
var someInts = [Int]()
print("count:\(someInts.count)")

// 创建一个带默认值的的Value
var threeDoubles = Array(repeating: 0.0, count: 3)
var anotherThreeDoubles = Array(repeating: 2.0, count: 3)

var sixDoubles = threeDoubles + anotherThreeDoubles

var shoppingList: [String] = ["Eggs","Milk"]

print("count:\(shoppingList.count)")

// 获取和修改
if(shoppingList.isEmpty){
    print("List is Empty")
}else{
    print("Shop not empty")
}

shoppingList.append("Flour")
shoppingList += ["Baking Powder","Cheess"]
shoppingList += ["Butter"]

var firstItem = shoppingList[0]
shoppingList[0] = "Six Eggs"

shoppingList[0...2] = ["Bannans","Apple"]
shoppingList.insert("Maple Syrup", at: 0)

let male = shoppingList.remove(at: 0)
let apple = shoppingList.removeLast()

for item in shoppingList{
    print(item)
}

for (index,value) in shoppingList.enumerated(){
    print("item \(index) :Value:\(value)");
}

// Set
var letters = Set<Character>()
print("letter is of type setr<>\(letters.count)")

letters.insert("a")
letters = []

var favoriteGenres: Set<String> = ["Rock","Classical","Hip"]
let alsoFAvout: Set = ["Rock","Classical","Hip"]

print("\(favoriteGenres.count)")

favoriteGenres.insert("Jazz")


if let removedGenre = favoriteGenres.remove("Rock"){
    print("\(removedGenre)")
}else{
    print("Else")
}

if favoriteGenres.contains("Funk"){
    print("Contain")
}else{
    print("Not Contain")
}

for gren in favoriteGenres.sorted(){
    print("\(gren)")
}

for gen in favoriteGenres.sorted().reversed(){
    print("\(gen)")
}

let oddDigits: Set = [1,3,5,7,9]
let evenDigits: Set = [0,2,4,6,8]
let singleDigitPrimeNumber: Set = [2,3,5,7]

oddDigits.union(evenDigits).sorted()
oddDigits.intersection(evenDigits).sorted()
oddDigits.subtracting(singleDigitPrimeNumber).sorted()
oddDigits.symmetricDifference(singleDigitPrimeNumber).sorted()

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
farmAnimals.isSuperset(of: houseAnimals)
farmAnimals.isDisjoint(with: cityAnimals)

let alongFormDict = Dictionary<String,Int>()
let shortDormDic = [String:Int]()

var nameOfInteger = [Int:String]()

nameOfInteger[16] = "sixteen"
print(nameOfInteger)

nameOfInteger = [:]

var airport: [String:String] = ["YYZ":"Tornoto","DUB":"Dubin"]
print("\(airport.count)")
if airport.isEmpty {
    print("Empty")
}else{
    print("\(airport)")
}

airport["LHR"] = "London"
airport["YYZ"] = "YYZas"
print(airport)

if let oldValue = airport.updateValue("Dublin International", forKey: "DUB"){
    print("oldValue:\(oldValue)")
}

if let airportName = airport["DUB"]{
    print(airportName)
}else{
    print("None")
}

airport["APL"] = "Apple International"
print(airport)
airport["APL"] = nil
print(airport)

if let removedValue = airport.removeValue(forKey: "DUB"){
    print(removedValue)
}else{
    print("False")
}

for (airportCode,airportName) in airport{
    print("Code:\(airportCode) Name:\(airportName)")
}

for code in airport.keys{
    print("AirPort code:\(code)")
}

for name in airport.values{
    print("Name:\(name)")
}

let airCodes = [String](airport.keys)
let airName = [String](airport.values)









