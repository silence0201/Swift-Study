

import Foundation

protocol Person {
    var firstName: String { get set }
    var lastName: String { get set }
    var fullName: String { get }
}

class Employee: Person{
    var no: Int = 0
    var job: String?
    var salary: Double = 0
    
    var firstName: String = "Tony"
    var lastName: String = "Guan"
    
    var fullName: String {
        get {
            return self.firstName + "." + self.lastName
        }
        set (newFullName) {
            var name = newFullName.components(separatedBy: ".")
            self.firstName = name[0]
            self.lastName = name[1]
        }
    }
}
