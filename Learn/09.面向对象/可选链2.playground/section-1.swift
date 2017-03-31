

class Employee {
    var no: Int = 0
    var name: String = "Tony"
    var job: String?
    var salary: Double = 0
    var dept: Department? = Department()
}


class Department {
    var no: Int = 10
    var name: String = "SALES"
    var comp: Company? = Company()
}

class Company {
    var no: Int = 1000
    var name: String = "EOrient"
}

let emp = Employee()

print(emp.dept!.comp!.name) //显示拆包可选链
print(emp.dept?.comp?.name) //隐式拆包可选链

