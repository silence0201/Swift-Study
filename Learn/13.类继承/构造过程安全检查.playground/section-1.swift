

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
        //self.toString()   //编译错误
        super.init(name: name, age: age)
        self.name = "Tom"
        self.age = 28
        self.toString()
        
    }
    convenience override init(name: String, age: Int) {
        self.init(name: name, age: age, school: "清华大学")
        self.name = "Tom"
    }
    
    func toString() {
        print("Studen : \(school) \(name) \(age)")
    }
}

let student = Student()
print("学生: \(student.description())")

