

class Employee {
    var no: Int = 0
    var firstName: String = "Tony"
    var lastName: String = "Guan"
    var job: String?
    var salary: Double = 0
    lazy var dept: Department = Department()
    
    var fullName: String {
        return firstName + "." + lastName
    }
}

struct Department {
    let no: Int = 0
    var name: String = ""
}

var emp = Employee()
print(emp.fullName)

//emp.fullName = "Tom.Guan"
//print(emp.fullName)

