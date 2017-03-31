

class Account {
    
    var amount: Double = 10_000.00         // 账户金额
    var owner: String = "Tony"             // 账户名
    
    func interestWithRate(rate: Double) -> Double {
        return rate * amount
    }
}

var myAccount = Account()
//调用实例方法
print(myAccount.interestWithRate(rate: 0.088))
