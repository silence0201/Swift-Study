
import Foundation

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
    
    var employees: [Employee] = [Employee]()
    //let employees = NSMutableArray()

    mutating func insert(object: AnyObject , index: Int)->() {
    //func insert(object: AnyObject , index: Int)->() {
        let emp = object as! Employee
        employees.insert(emp, at:index)
    }
}

var dept = Department()

var emp1 = Employee()
dept.insert(object: emp1, index: 0)

var emp2 = Employee()
dept.insert(object: emp2, index: 0)

var emp3 = Employee()
dept.insert(object: emp3, index: 0)

print(dept.employees.count)

