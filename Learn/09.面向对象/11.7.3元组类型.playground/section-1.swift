

private class Employee {
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

private let emp = Employee()
var dept = Department()

private var student1 = (dept, emp)
