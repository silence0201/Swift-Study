

class Employee {
    
    var no: Int = 0
    var name: String = ""
    var job: String = ""
    var salary: Double = 0
    var dept: Department? = Department()
    
    
    struct Department {
        var no: Int = 10
        var name: String = "SALES"
    }
    
}

let emp = Employee()

print(emp.dept?.name)
