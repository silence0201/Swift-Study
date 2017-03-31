

class Person {
    var name: String
    var age: Int
    
    func description() -> String {
        return "\(name) 年龄是: \(age)"
    }
    convenience init () {
        self.init(name: "Tony")
        self.age = 18
    }
    convenience init (name: String) {
        self.init(name: name, age: 18)
    }
    init (name: String, age: Int) {
        self.name = name
        self.age  = age
    }
}

class Student: Person {
    var school: String
    init (name: String, age: Int, school: String) {
        self.school = school
        super.init(name: name, age: age)
    }
}

class Worker: Person {
    var factory: String
    init (name: String, age: Int, factory: String) {
        self.factory = factory
        super.init(name: name, age: age)
    }
}
