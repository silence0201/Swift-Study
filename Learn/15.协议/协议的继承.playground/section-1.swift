
protocol Person {
    var firstName: String { get set }
    var lastName: String { get set }
    var fullName: String { get }
    func description() -> String
}

protocol Student: Person {
    var school: String { get set }
}

class Graduate: Student {
    
    var special: String
    
    var firstName: String
    var lastName: String
    var school: String
    
    var fullName: String {
        return self.firstName + "." + self.lastName
    }
    
    func description() -> String {
        return " firstName: \(firstName)\n lastName: \(lastName)\n School: \(school)\n Special: \(special)"
    }
    
    init (firstName: String, lastName: String, school: String, special: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.school = school
        self.special = special
    }
}

let gstudent = Graduate(firstName: "Tom", lastName: "Guan", school: "清华大学", special: "计算机")

print(gstudent.description())


