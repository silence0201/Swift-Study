

class Account {
    // 账户金额
    var amount: Double = 0.0
    //账户名
    var owner: String = ""
    //利率
    static var interestRate: Double = 0.0668
    
    // class换成static不能重写该属性
    class var staticProp: Double {
        return interestRate * 1_000_000
    }
    
    var instanceProp: Double {
        return Account.interestRate * self.amount
    }
}

class AccountB: Account {
    override class var staticProp: Double {
        return interestRate * 1_000_000
    }
}

//访问静态属性
print(Account.staticProp)

var myAccount = Account()
//访问实例属性
myAccount.amount = 1_000_000
//访问静态属性
print(myAccount.instanceProp)
