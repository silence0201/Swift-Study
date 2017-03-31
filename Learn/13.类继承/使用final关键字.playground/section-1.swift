

final class Person {
    
    var name: String
    
    final var age: Int
    
    final func description() -> String {
        return "\(name) 年龄是: \(age)"
    }
    
    final class func printClass() ->() {
        print( "Person 打印...")
    }
    
    init (name: String, age: Int) {
        self.name = name
        self.age  = age
    }
}

class Student: Person {                            //编译错误
    
    var school: String
    
    convenience init() {
        self.init(name: "Tony", age: 18, school: "清华大学")
    }
    
    init (name: String, age: Int, school: String) {
        self.school = school
        super.init(name: name, age: age)
    }
    
    override func description() -> String {         //编译错误
        print("父类打印 \(super.description())")
        return "\(name) 年龄是: \(age), 所在学校: \(school)。"
    }
    
    override class func printClass() ->() {      //编译错误
        print( "Student 打印...")
    }
    
    override var age: Int {                        //编译错误
        get {
            return super.age
        }
        set {
            super.age = newValue < 8 ? 8: newValue
        }
    }
}
