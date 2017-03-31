
import Foundation

class Employee {
    var no: Int
    var name: String
    var job: String
    var salary: Double
    weak var dept: Department?

    init(no: Int, name: String, job: String, salary: Double) {
        self.no = no
        self.name = name
        self.job = job
        self.salary = salary
        print("员工\(name) 已经构造成功。")
    }
    deinit {
        print("员工\(name) 已经析构成功。")
    }

}

class Department {
    var no: Int = 0
    var name: String = ""
    var manager: Employee?

    init(no: Int, name: String) {
        self.no = no
        self.name = name
        print("部门\(name) 已经构造成功。")
    }
    deinit {
        print("部门\(name) 已经析构成功。")
    }
}

var emp: Employee?
var dept: Department?

emp = Employee(no: 7698, name: "Blake", job: "Salesman", salary: 1600)
dept = Department(no: 30, name: "Sales")

emp!.dept = dept
dept!.manager = emp

emp = nil
dept = nil
