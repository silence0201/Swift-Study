

struct Department {
    var no : Int = 0
    var name : String = ""
}

func ==(lhs: Department, rhs: Department) -> Bool {
    return lhs.name == rhs.name && lhs.no == rhs.no
}

func !=(lhs: Department, rhs: Department) -> Bool {
    if (lhs.name != rhs.name || lhs.no != rhs.no) {
        return true
    }
    return false
}


var dept1 = Department()
dept1.no = 10
dept1.name = "Sales"

var dept2 = Department()
dept2.no = 10
dept2.name = "Sales"

if dept1 == dept2 {
    print("dept1 == dept2")
} else {
    print("dept1 != dept2")
}

if dept1 != dept2 {
    print("dept1 != dept2")
} else {
    print("dept1 == dept2")
}

