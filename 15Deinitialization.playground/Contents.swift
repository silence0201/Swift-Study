//: Playground - noun: a place where people can play

struct Bank{
    static var coinsInBank = 10_000
    static func distribute(conins numberOfCoinsRequested: Int) ->Int{
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    
    static func receive(conins: Int){
        coinsInBank += conins
    }
}

class Player{
    var coninsInPurse: Int
    init(coins: Int){
        coninsInPurse = Bank.distribute(conins: coins)
    }
    func win(coins: Int){
        coninsInPurse += Bank.distribute(conins: coins)
    }
    deinit {
        Bank.receive(conins: coninsInPurse)
    }
}

var playerOne: Player? = Player(coins: 100)
print("A new player has joined the game with \(playerOne!.coninsInPurse) coins")
print("There are now \(Bank.coinsInBank) coins left in the bank")

playerOne!.win(coins: 2_000)
print("PlayerOne won 2000 coins & now has \(playerOne!.coninsInPurse) coins")
print("The bank now only has \(Bank.coinsInBank) coins left")

playerOne = nil
print("PlayerOne has left the game")
print("The bank now has \(Bank.coinsInBank) coins")
Bank.coinsInBank
