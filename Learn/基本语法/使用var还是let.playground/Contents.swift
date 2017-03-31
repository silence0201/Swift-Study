


import Foundation

class Person {
    var name : String
    var age : Int

    init (name : String, age : Int) {
        self.name = name
        self.age  = age
    }
}

let p1 = Person(name: "Tony", age: 18)
p1.age  = 20

p1 = Person(name: "Tom", age: 18) //编译错误
