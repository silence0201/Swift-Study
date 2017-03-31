

protocol Account  {
    static var interestRate: Double {get}  //利率
    static func interestBy(amount: Double) -> Double
}

class ClassImp: Account {
    
    static var interestRate: Double  {
        return 0.0668
    }
    class func interestBy(amount: Double) -> Double {
        return ClassImp.interestRate * amount
    }
}

struct StructImp: Account {
    
    static var interestRate: Double = 0.0668
    static func interestBy(amount: Double) -> Double {
        return  StructImp.interestRate * amount
    }
}

enum EnumImp: Account {
    
    static var interestRate: Double = 0.0668
    static func interestBy(amount: Double) -> Double {
        return  EnumImp.interestRate * amount
    }
}
