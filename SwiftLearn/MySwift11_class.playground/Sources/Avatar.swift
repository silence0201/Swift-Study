import UIKit
/**
 * 继承
 */

//角色类
class Avatar{
    let name: String //名字
    var life = 100{ //生命值 //属性观察器.
        didSet{
            if self.life <= 0 {
                self.isAlive = false
            }
            if life > 100 {
                life = 100
            }
        }
    }
    var isAlive: Bool = true //是否活着
    var description: String { //计算型属性
        return "I'm Avatar \(name)."
    }
    
    required init(name: String){
        self.name = name
    }
    
    convenience init(firstName: String, lastName: String){
        self.init(name: firstName + " " + lastName)
    }
    
    //被攻击, 生命值减attack
    func beAttached(attack: Int){
        life -= attack
        if life <=  0{
            isAlive = false
        }
    }
}

//User用户角色 继承 Avatar
class User: Avatar{
    var score = 0 //分数
    var level = 0 //等级
    override var description: String{ //属性重载
        return "I'm User \(name)."
    }
    var group: String
    
    init(name: String, group: String){
        //第一段构造初值
        self.group = group //子类的属性必须先被初始化, 父类的属性才能被初始化. *****
        //self.name = name //error 父类的属性必须通过父类的构造函数.
        super.init(name: name) //必须通过父类的构造函数初始化父类的属性.
        
        //第二段构造 进一步完善属性的初始逻辑.
        if group.isEmpty {
            self.getScore(score: -10) //如果没有设定加入的组名, 统一给User减10分.
        }
    }
    
    //convenience在构造函数中通过调用自己的构造函数来完成构造.
    convenience init(group: String){
        //第一阶段 可以使用 静态方法和静态属性
        let name = User.generateUserName()
        //self.group = group //error 此时还不能使用self, Swift认为属性初始化是在slef.init中完成的, 所以还不能使用self的.
        self.init(name: name, group: group) //必须加self.才能调用自己的构造函数. ****
    }
    
    //convenience 和 override 关键字顺序可以随意
    //当父类的init(name)加上required标示是必须实现的构造函数时, 此时override就没有必要了, 但是required还是必须写上.
    /*override*/ required convenience init(name: String){
        self.init(name: name, group: "")
    }
    
    //这个方法不能被子类override覆盖的.
    final func getScore(score: Int){ //加分
        self.score += score
        if self.score > level * 100{
            level += 1
        }
    }
    
    static func generateUserName() -> String{ //静态方法动态生成用户名.
        return "Player" + String(arc4random()%1_000_000)
    }
}

//魔法师角色.
//final 最终类, 不能再被继承了
final class Magician: User{
    var magic = 100 //魔法值
    override var description: String{
        return "I'm Magician \(name)."
    }
    
    //重载父类的构造函数override
    override init(name: String, group: String) {
        //注: 第一段构造中不可以使用self相关的属性和方法
        let defaultGroups = ["Gryffindor", "Hufflepuff", "Ravenclaw", "Slytherin"]
        for theGroup in defaultGroups{ //限定魔法师只能所属于这四个group.
            if group == theGroup{
                super.init(name: name, group: group)
                return
            }
        }
        
        let group = defaultGroups[Int(arc4random())%4] //随机指定四个组中的任意一个.
        super.init(name: name, group: group)
    }
    
    func heal(user: User){
        user.life += 10
    }
}

//战士类
final class Warrior: User{
    static let weapons = ["Sword", "Axe", "Spear"]
    var weapon: String //武器[可选]
    override var description: String{
        return "I'm Warrior \(name)."
    }
    
    //给构造函数的参数加默认值, 这样Warrior就有多种构造函数了.
    init(name: String, group: String, weapon: String = "Sword"){
        self.weapon = weapon
        super.init(name: name, group: group)
    }
    
    //override和convenience同时使用, 即覆写了父类的构造函数, 同时通过自身现有的构造函数来方便的完成初始化.
    convenience override init(name: String, group: String) {
        let weapon = Warrior.weapons[ Int(arc4random()) % Warrior.weapons.count ]
        self.init(name: name, group: group, weapon: weapon)
    }
    
    //重载父类的构造函数.
    //    override init(name: String, group: String) {
    //        self.weapon = Warrior.weapons[ random() % Warrior.weapons.count ]
    //        super.init(name: name, group: group)
    //    }
    
    //覆写父类方法, 当战士的受攻击时, 生命值只减的一半攻击量.
    override func beAttached(attack: Int) {
        self.life -= attack/2
    }
}

//巨兽 怪物
class Monster: Avatar{
    override var description: String{ //属性重载.
        return "I'm Monster \(name)."
    }
    
    //如果Monster没有自己的构造函数, 则自动继承了父类的构造函数
    //所以当convenience init构造时, self.init(name)实际上是把继承于父类的构造函数当作自己的构造函数,
    //从而满足了convenience关键字.
    //当init(name)构造函数加上required时, Monster虽然没有实现init(name), 但是它是通过继承实现了init(name),
    //所以此时的self.init(name)其实是来自父类的required init(name)构造函数.
    convenience init(type: String){
        self.init(name: type)
    }
    
    //攻击用户
    func attack(user: User, amount: Int){
        user.beAttached(attack: amount)
    }
}

//僵尸
final class Zombie: Monster{
    var type = "Default"
    override var description: String{
        return "I'm Zombie \(name)."
    }
}

class NPC: Avatar{
    let career: String
    
    //由于NPC写了自己的构造函数, 所以NPC就不能继承父类的构造函数了, 就必须有实现required init(name)构造函数.
    init(name: String, career: String){
        self.career = career
        super.init(name: name)
    }
    
    //在这里NPC写了属于自己的构造函数, 对于required的构造函数就不能通过继承来实现了, 就必须显示写出来.
    required convenience init(name: String) {
        //fatalError("init(name:) has not been implemented")
        self.init(name: name, career: "")
    }
}
