
import Foundation

class Person {
    var name: String
    var age: Int
    
    func description() -> String {
        return "\(name) 年龄是: \(age)"
    }
    
    convenience init() {
        self.init(name: "Tony")
        self.age = 18
    }
    convenience init(name: String) {
        self.init(name: name, age: 18)
    }
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

class Student: Person {
    var school: String
    init(name: String, age: Int, school: String) {
        self.school = school
        super.init(name: name, age: age)
    }
    convenience override init(name: String, age: Int) {
        self.init(name: name, age: age, school: "清华大学")
    }
}

class Graduate: Student {
    var special: String = ""
}

let student1 = Student()
let student2 = Student(name: "Tom")
let student3 = Student(name: "Tom", age: 28)
let student4 = Student(name: "Ben", age: 20, school: "香港大学")


let gstudent1 = Graduate()
let gstudent2 = Graduate(name: "Tom")
let gstudent3 = Graduate(name: "Tom", age: 28)
let gstudent4 = Graduate(name: "Ben", age: 20, school: "香港大学")
