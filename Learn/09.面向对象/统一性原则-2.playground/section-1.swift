

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

public func getEmpDept(emp: Employee) -> Department? {//错误    
    return emp.dept
}
