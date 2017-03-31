

class Account {
    
    var owner: String = "Tony"     //账户名
    
    //不能换成static
    class func interestBy(amount: Double) -> Double {
        return 0.08886 * amount
    }
}

class TermAccount: Account {//定期账户
    override class func interestBy(amount: Double) -> Double {
        return 0.09 * amount
    }
}

//调用类型方法
print(Account.interestBy(amount: 10_000.00 ))
print(TermAccount.interestBy(amount: 10_000.00 ))
