

class Rectangle {
    var width: Double
    var height: Double
    
    init() {
        width   = 0.0
        height  = 0.0
    }
}

var rect = Rectangle()
rect.width = 320.0
rect.height = 480.0

print("长方形:\(rect.width) x \(rect.height)")


class Employee {
    let no: Int
    var name: String?
    var job: String?
    var salary: Double
    var dept: Department?
    
    init() {
        no = 0
        salary = 0.0
        dept = nil
    }
}

struct Department {
    let no: Int
    var name: String
    init() {
        no = 10
        name = "SALES"
    }
}

let dept = Department()
var emp = Employee()
