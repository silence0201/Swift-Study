

class Account {
    //账户名
    var owner: String = "Tony"
    // class换成static不能重写该方法
    class func interestBy(amount: Double) -> Double {
        return 0.08886 * amount
    }
}

class AccountB: Account {
    override static func interestBy(amount: Double) -> Double {
        return 0.0889 * amount
    }
}

//调用静态方法
print(Account.interestBy(amount: 10_000.00))
