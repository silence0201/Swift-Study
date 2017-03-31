
class Employee {
    var no: Int = 0
    var name: String = ""
    var job: String?
    var salary: Double = 0
    var dept: Department?
}

struct Department {
    var no: Int = 0
    var name: String = ""
}

var dept = Department()
dept.no = 10
dept.name = "Sales"

let emp = Employee()
emp.no = 1000
emp.name = "Martin"
emp.job = "Salesman"
emp.salary = 1250
emp.dept = dept

func updateDept( dept: inout Department) {
    dept.name = "Research"
}

print("Department更新前:\(dept.name)")
updateDept(dept: &dept)
print("Department更新后:\(dept.name)")

func updateEmp(emp: Employee) {
    emp.job = "Clerk"
}

print("Employee更新前:\(emp.job!)")
updateEmp(emp: emp)
print("Employee更新后:\(emp.job!)")
