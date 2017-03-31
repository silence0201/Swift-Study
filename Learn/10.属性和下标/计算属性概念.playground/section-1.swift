
import Foundation

class Employee {
    var no: Int = 0
    var firstName: String = "Tony"
    var lastName: String = "Guan"
    var job: String?
    var salary: Double = 0
    lazy var dept: Department = Department()
    
    var fullName: String {
        get {
            return firstName + "." + lastName
        }
        
        set (newFullName) {
            let name = newFullName.components(separatedBy: ".")
            firstName = name[0]
            lastName = name[1]
        }
        
        //        set {
        //            let name = newValue.components(separatedBy: ".")
        //            firstName = name[0]
        //            lastName = name[1]
        //        }
        
    }
}

struct Department {
    let no: Int = 0
    var name: String = ""
}

var emp = Employee()
print(emp.fullName)

emp.fullName = "Tom.Guan"
print(emp.fullName)

