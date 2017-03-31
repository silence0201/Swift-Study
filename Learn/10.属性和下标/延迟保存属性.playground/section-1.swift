

class Employee {
    var no: Int = 0
    var name: String = ""
    var job: String?
    var salary: Double = 0
    lazy var dept: Department = Department()
}

struct Department {
    let no: Int = 0
    var name: String = ""
}

let emp = Employee()
emp.no = 1000
emp.name = "Martin"
emp.job = "Salesman"
emp.salary = 1250

print(emp.dept.no)
