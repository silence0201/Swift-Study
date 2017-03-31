
class Employee {
    let no: Int = 0
    var name: String = ""
    var job: String?
    var salary: Double = 0
    var dept: Department?
}

struct Department {
    var no: Int = 0
    var name: String = ""
}

let emp = Employee()
// emp.no = 100            //编译错误

let dept = Department()
//dept.name = "SALES"     //编译错误

let emp1 = Employee()
emp1.name =  "Tony"
