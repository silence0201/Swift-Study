

import Foundation

class Person {
    
    var name: String
    var age: Int
    
    func description() -> String {
        return "\(name) 年龄是: \(age)"
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

class Student: Person {
    
    var school: String
    
    override var age: Int {
        get {
            return super.age
        }
        set {
            super.age = newValue < 8 ? 8 : newValue
        }
    }
    
    convenience init() {
        self.init(name: "Tony", age: 18, school: "清华大学")
    }
    
    init(name: String, age: Int, school: String) {
        self.school = school
        super.init(name: name, age: age)
    }
}

let student1 = Student()
print("学生年龄：\(student1.age)")
student1.age = 6
print("学生年龄：\(student1.age)")
