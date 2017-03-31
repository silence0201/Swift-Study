

class Account {
    
    var amount: Double = 0.0               // 账户金额
    var owner: String = ""                 //账户名
    
    var interestRate: Double = 0.0668       //利率
    
    //class不能换成static
    class var staticProp: Double {
        return 0.0668 * 1_000_000
    }
    
    var instanceProp: Double {
        return self.interestRate * self.amount
    }
}

class TermAccount: Account {
    override class var staticProp: Double {
        return 0.0700 * 1_000_000
    }
}

//访问类型属性
print(Account.staticProp)
print(TermAccount.staticProp)
