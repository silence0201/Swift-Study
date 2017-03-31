


enum Account {
    
    case 中国银行
    case 中国工商银行
    case 中国建设银行
    case 中国农业银行
    
    static var interestRate : Double = 0.668 //利率
    
    static func interestBy(amount : Double) -> Double {
        return interestRate * amount
    }
}

//调用静态方法
print(Account.interestBy(amount: 10_000.00 ))
