//: Playground - noun: a place where people can play

import UIKit
protocol Record: CustomStringConvertible{
    var wins: Int {get}
    var losses: Int {get}
}

// 扩展一个协议的时候，可以拥有实现！***** 抽象扩展协议实现类
extension Record{
    var description: String{
        return String(format: "WINS: %d , LOSSES: %d", arguments:[wins,losses])
    }
    
    func shoutWins(){
        print("WE WIN",wins,"TIMES!!!")
    }
    
    var gamePlayed: Int{
        return wins + losses
    }
    
    func winningPercent() -> Double {
        return Double(wins)/Double(gamePlayed)
    }
}

//可以有平局的协议
protocol Tieable {
    var ties: Int{get set} //平局次数
}

//扩展遵守了Tieable协议的Record子类型 *****
extension Record where Self: Tieable{
    var gamePlayed: Int{ //重写了gamePlayed属性
        return wins + losses + ties
    }
    
    //此处需要重写, 实现Tieable协议的Record类型才会使用此处实现.否则使用的是Record的扩展
    func winningPercent() -> Double {
        return Double(wins)/Double(gamePlayed)
    }
}

//可奖励
protocol Prizable {
    func  isPrizable() -> Bool
}

//篮球比赛记录
struct BasketballRecord: Record, Prizable{
    var wins: Int
    var losses: Int
    
    func isPrizable() -> Bool {
        return wins > 2
    }
}
//extension BasketballRecord: CustomStringConvertible{}

//棒球比赛记录
struct BaseballRecord: Record, Prizable{
    var wins: Int
    var losses: Int
    let gamePlayed: Int = 162
    
    func isPrizable() -> Bool {
        return gamePlayed > 10 && winningPercent() >= 0.5
    }
}

//这会使用扩展extension Record where Self: Tieable 中的实现
//足球比赛记录
struct FootballRecord: Record, Tieable, Prizable{
    var wins: Int
    var losses: Int
    var ties: Int //平局次数
    
    func isPrizable() -> Bool {
        return wins > 1
    }
}

let teamRecord = BasketballRecord(wins: 2, losses: 10)
print(teamRecord)

teamRecord.shoutWins()

// 扩展标准库中的协议
extension CustomStringConvertible{
    var descriptionWithDate: String{
        return NSDate().description + " " + description
    }
}

print(teamRecord.descriptionWithDate )

let basketballTeamRecord = BasketballRecord(wins: 2, losses: 10)
let baseballTeamRecord = BaseballRecord(wins: 10, losses: 5)

basketballTeamRecord.gamePlayed
baseballTeamRecord.gamePlayed

let footballTeamRecord = FootballRecord(wins: 1, losses: 1, ties: 1)
footballTeamRecord.gamePlayed
footballTeamRecord.winningPercent()

//协议的聚合 protocol<协议列表> 代表one参数必须实现这些协议列表
func award(one: Prizable & CustomStringConvertible){
    if one.isPrizable(){
        print(one)
        print("Congratulation! You won a prize!")
    }
    else{
        print("You can not have the prize!")
    }
}

award(one: baseballTeamRecord)

struct Student: Prizable, CustomStringConvertible, Equatable, Comparable{
    var name: String
    var score: Int
    var description: String{ //CustomStringConvertible
        return name
    }
    
    func isPrizable() -> Bool {
        return score >= 60
    }
}
func ==(s1: Student, s2: Student) -> Bool{ return s1.score == s2.score}
func <(s1:Student, s2:Student) -> Bool{return s1.score < s2.score}

let kangqiao = Student(name: "Kangqiao", score: 100)
award(one: kangqiao)

let a = Student(name: "Alice", score: 80)
let b = Student(name: "Bob", score: 92)
let c = Student(name: "Karl", score: 85)
let students = [a, b, c, kangqiao]

//泛型函数 => 求数组中的最大值, 前提是数组的元素必须实现Comparable协议
//泛型T继承Comparable协议
func topOne<T: Comparable>(seq: [T]) -> T{
    assert(seq.count > 0)
    return seq.reduce(seq[0]){ //结尾闭包形式的应用
        max($0, $1)
    }
}

topOne(seq: [4, 5, 7, 2])
topOne(seq: ["Hello", "Swift"])
topOne(seq: students)

//因为seq有可能为空, 或者seq数组中的元素有可能都是不可奖励的isPrizable为false, 所以返回可选型
func topPrizableOne<T: Comparable & Prizable>(seq:[T]) -> T?{
    //从nil开始reduce, 开始依次比较tempTop(默认是第一个nil) 和 contender这两个T类型的实现
    return seq.reduce(nil){ (tempTop: T?, contender: T) in
        //先保证contender是可奖励的, 否则这次比较直接选tempTop
        guard contender.isPrizable() else{
            return tempTop
        }
        
        //对tempTop可选型解包,若失败,则这次比较选contender
        guard let tempTop = tempTop else{
            return contender
        }
        
        //当guard保证这次比较的两个参数tempTop, contender都没问题的, 才进入真正的比较max
        return max(tempTop, contender)
    }
}

topPrizableOne(seq: students)?.name //?强制解包

/**
 * 事实上Swfit是一个重度依赖协议的语言
 * Swift重度使用结构体struct, 结构体不需要像类那样考虑继承的关系
 * Swfit标准库中有: Classes 6, Enum 8, Structs: 103, Protocol: 86
 */
var a2: Int = 3
var arr2: Array<Int> = []
//Swfit语言关注协议所描述的特征的实现, 而非底层类的实现

/**
 * 协议的应用 设计模式委托 Delegation in UIKit
 */
//创建自己的委托协议机制
protocol TurnBasedGame{ //回合制游戏
    var turn: Int{get set} //回合数
    func play()
}

//委托协议流程 
// 注:如果你的协议中声明有optional函数, 协议的开头就必须有@objc关键字, 这是与ObjectC桥接的问题
//    同时这个协议的实现就必须是一个类class, 这个类也必须是OC的NSObject的子类
@objc protocol TurnBasedGameDelegate {
    func gameStart() //游戏开始
    func playerMove() //每回合玩家进行的动作
    func gameEnd() //游戏结束
    
    @objc optional func turnStart() //每一回合的开始
    @objc optional func turnEnd() //每一回合的结束
    
    func gameOver() -> Bool //判断每一回合游戏是否结束
}
//单人回合游戏基本框架
class SinglePlayerTurnBasedGame: NSObject, TurnBasedGame{
    var turn = 0
    var delegate: TurnBasedGameDelegate! //暂时的可选型, 类必须设置这个delegate
    func play(){
        delegate.gameStart()
        while !delegate.gameOver() {
            if let turnStart = delegate.turnStart{ //对turnStart可选型函数进行解包
                turnStart()
            }
            else{
                print("ROUND", turn, ":")
            }
            delegate.playerMove()
            delegate.turnEnd?() //尝试对turnEnd可选型函数进行解包, 如果成功调用, 否则不调用
            turn += 1
        }
        delegate.gameEnd()
    }
}

//抛掷骰子游戏, 得分超过100 即为win!
class RollNumberGame: SinglePlayerTurnBasedGame, TurnBasedGameDelegate{
    var score = 0
    
    override init() {
        super.init()
        delegate = self
    }
    
    func gameStart() {
        score = 0
        turn = 0
        print("Welcome to Roll Number Game.")
        print("Try to use least turn to make total 100 scores!")
    }
    
    func gameOver() -> Bool {
        return score >= 100
    }
    
    func playerMove() {
        let rollNumber = Int(arc4random()) % 6 + 1
        score += rollNumber
        print("You rolled a ", rollNumber, " ! The score is ", score, " now!")
    }
    
    func gameEnd() {
        print("Congratulation! You win the game in", turn , "ROUND!")
    }
}

let rollNumberGame = RollNumberGame()
rollNumberGame.play()

//石头剪刀布游戏 三局两胜制
class RockPaperScissors: SinglePlayerTurnBasedGame, TurnBasedGameDelegate{
    enum Shape: Int, CustomStringConvertible{
        case Rock
        case Scissors
        case Paper
        
        var description: String{
            switch self {
            case .Paper: return "Paper"
            case .Rock: return "Rock"
            case .Scissors: return "Scissors"
            }
        }
        
        func beat(shape: Shape) -> Bool{
            return (self.rawValue + 1) % 3 == shape.rawValue
        }
    }
    
    var wins = 0
    override init(){
        super.init()
        delegate = self
    }
    
    static func go() -> Shape{
        return Shape(rawValue: Int(arc4random()) % 3)!
    }
    
    func gameStart() {
        wins = 0
        print("== Rock Paper Scissor ==")
    }
    
    func gameOver() -> Bool {
        return turn >= 3
    }
    
    func gameEnd() {
        if wins >= 2{
            print("You win!")
        }
        else {
            print("You lose...")
        }
    }
    
    func turnStart() {
        print("== ROUND START ==", turn, ":")
    }
    
    func turnEnd() {
        print("=================")
    }
    
    func playerMove() {
        let yourShape = RockPaperScissors.go()
        let otherShape = RockPaperScissors.go()
        print("Your:", yourShape)
        print("Other:", otherShape)
        
        if yourShape.beat(shape: otherShape){
            print("You win this round")
            wins += 1
        }
        else{
            print("You didn't win")
        }
    }
}

let rockPaperScissors = RockPaperScissors()
rockPaperScissors.play()












