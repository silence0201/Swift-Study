


enum Account {
    
    case 中国银行
    case 中国工商银行
    case 中国建设银行
    case 中国农业银行
    
    static var interestRate: Double = 0.668  //利率
    
    static var staticProp: Double {
        return interestRate * 1_000_000
    }
    
    var instanceProp: Double {
        
        switch (self) {
        case .中国银行:
            Account.interestRate = 0.667
        case .中国工商银行:
            Account.interestRate = 0.669
        case .中国建设银行:
            Account.interestRate = 0.666
        case .中国农业银行:
            Account.interestRate = 0.668
        }
        return Account.interestRate * 1_000_000
    }
}

//访问静态属性
print(Account.staticProp)

var myAccount = Account.中国工商银行
//访问实例属性
print(myAccount.instanceProp)
