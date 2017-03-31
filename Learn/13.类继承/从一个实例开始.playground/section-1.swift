
class Person {
    var name: String
    var age: Int
    
    func description() -> String {
        return "\(name) 年龄是: \(age)"
    }
    
    init() {
        name = ""
        age = 1
    }
}

class Student: Person {
    var school: String
    override init() {
        school = ""
        super.init()
        age = 8
    }
}

let student = Student()
print("学生: \(student.description())")
