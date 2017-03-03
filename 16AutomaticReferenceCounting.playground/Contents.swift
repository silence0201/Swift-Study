//: Playground - noun: a place where people can play

// 引用计数
class Person{
    let name: String
    init(name: String){
        self.name = name
        print("\(name) is being init")
    }
    deinit {
        print("\(name) is being deinit")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "Jhnh")
reference2 = reference1
reference3 = reference1

reference1 = nil
reference2 = nil
reference3 = nil

// 循环引用
class Person2{
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit {
        print("\(name) is being deinitialized")
    }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    var tenant: Person2?
    deinit { print("Apartment #\(unit) is being deinitialized") }
}

var john: Person2?
var unit4A: Apartment?

john = Person2(name: "John")
unit4A = Apartment(unit: "4A")

john!.apartment = unit4A
unit4A!.tenant = john

john = nil
unit4A = nil

// 若引用
class Person3{
    let name: String
    init(name: String) {
        self.name = name
    }
    var apartment: Apartment3?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment3{
    let unit: String
    init(unit: String) {
        self.unit = unit
    }
    weak var tenant:Person3?
    deinit {
        print("Apartment #\(unit) is being deinitialized")
    }
}

var james: Person3?
var number74: Apartment3?

james = Person3(name: "James Appleseed")
number74 = Apartment3(unit: "74")

james!.apartment = number74
number74!.tenant = james

james = nil
number74 = nil

// 无主引用
class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) { self.name = name }
    deinit { print("\(name) is being deinitialized") }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { print("Card #\(number) is being deinitialized") }
}

var justin: Customer?
justin = Customer(name: "Justin McIntyre")
justin!.card = CreditCard(number: 1234_5678_9012_3456, customer: justin!)
justin = nil

class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}

var country = Country(name: "Canada", capitalName: "Ottawa")
print("\(country.name)'s capital city is called \(country.capitalCity.name)")

// 闭包循环引用
class HTMLElement {
    let name: String
    let text: String?
    lazy var asHTML: () -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

let heading = HTMLElement(name: "h1")
let defaultText = "some default text"
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}
print(heading.asHTML())

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML())
paragraph = nil

class HTMLElement2 {
    let name: String
    let text: String?
    lazy var asHTML: () -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}
var paragraph2: HTMLElement2? = HTMLElement2(name: "p", text: "hello, world")
print(paragraph2!.asHTML())

paragraph2 = nil
