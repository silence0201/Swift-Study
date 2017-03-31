
protocol Account  {
    static func interestBy(amount: Double) -> Double
}

class ClassImp: Account {
    class func interestBy(amount: Double) -> Double {
        return 0.0668 * amount
    }
}

struct StructImp: Account {
    static func interestBy(amount: Double) -> Double {
        return 0.0668 * amount
    }
}

enum EnumImp: Account {
    static func interestBy(amount: Double) -> Double {
        return 0.0668 * amount
    }
}
