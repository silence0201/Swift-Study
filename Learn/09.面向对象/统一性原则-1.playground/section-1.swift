

private class Employee {
    var no: Int = 0
    var name: String = ""
    var job: String?
    var salary: Double = 0
    var dept: Department?
}

internal struct Department {
    var no: Int = 0
    var name: String = ""
}


public let emp = Employee()       //编译错误

public var dept = Department()    //编译错误
