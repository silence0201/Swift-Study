
protocol Editable  {
    mutating func edit()
}

class ClassImp: Editable {
    var name = "ClassImp"
    func edit() {
        print("编辑ClassImp...")
        self.name = "编辑ClassImp..."
    }
}

struct StructImp: Editable {
    var name = "StructImp"
    mutating func edit() {
        print("编辑StructImp...")
        self.name = "编辑StructImp..."
    }
}

enum EnumImp: Editable {
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    
    mutating func edit() {
        print("编辑EnumImp...")
        self = .Friday
    }
}


var classInstance: Editable = ClassImp()
classInstance.edit()

var structInstance: Editable = StructImp()
structInstance.edit()

var enumInstance: Editable = EnumImp.Monday
enumInstance.edit()
