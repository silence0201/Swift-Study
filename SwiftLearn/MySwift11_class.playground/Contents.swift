//: Playground - noun: a place where people can play

import UIKit

/*** Swift Class **/
//define class
class Person{
    
    let firstName: String
    let lastName: String
    
    init(firstName: String, lastName:String){
        self.firstName = firstName
        self.lastName = lastName
    }
    
    init?(fullName:String){
        guard let spaceIndex = fullName.characters.index(of: " ") else{
            return nil
        }
        
        self.firstName = fullName.substring(to: spaceIndex)
        self.lastName = fullName.substring(from: fullName.index(after: spaceIndex))
    }
    
    func fullName() -> String{
        return firstName + " " + lastName
    }
}

let person1 = Person(firstName: "Alexander", lastName: "Hamilton") //返回Persion类型的persion1常量.
let person2 = Person(fullName: "Steve Jobs") //初始化使用了init?可失败的构造函数, 所以返回可选型Person?

print("#############")
print(person1.fullName())
print(person2!.fullName())

//***** 类是引用类型.
class Person2{
    
    var firstName: String
    let lastName: String
    var career: String?
    
    init(firstName: String, lastName: String, career: String){
        self.firstName = firstName
        self.lastName = lastName
        self.career = career
    }
    
    init(firstName: String, lastName: String){
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func fullName() -> String{
        return firstName + " " + lastName
    }
    
    func changeCareer(newCareer : String){
        self.career = newCareer //由于class是引用类型, 所以可以方法中改变其自身的属性.
    }
}

let p1 = Person2(firstName: "Yubo", lastName: "Liu", career: "Developer")
let p2 = p1
p2.firstName = "Steve" //虽然p1被let修饰, 其var修饰的firtName属性仍能被改变, 这点区别于值类型的结构体枚举类型.
//p2.lastName = "Jobs"  //lastName 被let修饰, 不可以改变.
p2.changeCareer(newCareer: "CEO") //由于career是被var修饰, 所以可以调用changeCareer方法修改其值.

p2

p1 //p1和p2是引用类型所以一个改变其另一个也被改变了

struct LocationStruct{
    var x = 0
    var y = 0
    
//    func goEast(){
//        self.x += 1 //'self' is immutable 由于Location是值类型, self不能改变自己
//    }
    
    //关键字mutating 修饰后, 即可改变值类型的自己的值.
    mutating func goEast(){
        self.x += 1
    }
}

var ll1 = LocationStruct()
//ll1.x = 5 //let修饰的ll1不能改变其结构体内部值.
ll1.goEast()
ll1

enum Switch{
    case On
    case Off
    
    //由于枚举是值类型, 如果方法要改变其自身, 就需要mutating修饰.
    mutating func click(){
        switch self{
        case .On:
            self = .Off
        case .Off:
            self = .On
        }
    }
}

var button = Switch.Off
button.click()
button

//类的等价 === 和 !==
//由于==本质是值的比较, 它只能用于值类型的比较, 不能用于引用类型.
//p1 == p2 //Binary operator '==' cannot be applied to two 'Person2' operands.

p1 === p2 // '===' 用于比较引用类型是否是同一类型的变量是否指向同样的内存空间.

let p3 = Person2(firstName: "Steve", lastName: "Liu", career: "CEO")
p1 === p3 //p1和p3分别指向不同的内存空间. 所以false
p1 !== p3 //p1和p3分别指向不同的内存空间. 所以true

/***
 * 什么时候用结构体??
 *    把结构体看作是值 例如 1.位置(经纬度) 2.坐标(二维, 三维) 3.温度 ...
 *    结构体是值类型 封装值的时候通常用值类型.
 *    结构体比类更"轻量级" 比类更高效, 
 *    结构体在内存空间的栈中.
 * 什么时候用类??
 *    把类看作物体 例如 1.人 2.车 3.动物 4.商店 ...
 *    类是引用类型 如果经常改变用类. 封装物体时通常使用类.
 *    类是可以被继承的
 *    类在内存空间的堆中.
 **/

/***
 * 
 * 类的第二章
 * 构建类和结构体的属性和方法
 *
 **/
//计算型的属性
struct Point{
    var x = 0.0
    var y = 0.0
}

struct Size{
    var width = 0.0
    var height = 0.0
}

class Rectangle{
    var origin = Point() //存储型的属性
    var size = Size() //存储型的属性
    var center: Point{ //计算型属性, 必须声明为var, 必须显示声明它的类型Point, 要想给其赋值必须使用get, set,
        
        //getter
        get{
            let centerX = origin.x + size.width/2
            let centerY = origin.y + size.height/2
            return Point(x: centerX, y: centerY)
        }
        
        //setter
        set(newCenter){ //如果不指定newCenter参数名, 可以使用默认newValue
            origin.x = newCenter.x - size.width/2
            origin.y = newCenter.y - size.height/2
        }
    }
    
    var area: Double{ //计算型属性
        get{
            return size.width * size.height
        }
    }
    
    init(origin: Point, size: Size){
        self.origin = origin
        self.size = size
    }
}

var rect = Rectangle(origin: Point(), size: Size(width: 10, height: 5))
rect.center // x=5, y=2.5

rect.origin = Point(x: 10, y: 10) //改变origin位置属性, center计算型属性相即被改变了
rect.center // x=15, y=12.5

rect.center = Point() // 如果有setter方法, 改变center的值也相即改变了origin的值.
rect

//Apple官方提供的CGRect
var rect2 = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 10, height: 5))
rect2

//类型属性 Type property
class Player{
    var name: String
    var score = 0
    static var highestScore = 0 //类型属性, 它是属于类的. 对类的对象共享.
    
    init(name: String){
        self.name = name
    }
    
    func play(){
        let score = Int(arc4random())%100
        print("\(name) played and got \(score) scores.")
        
        self.score += score
        print("Total score of \(name) is \(self.score).")
        
        if self.score > Player.highestScore{ //引用highestScore静态属性时, 类名不能省略.
            Player.highestScore = self.score
        }
        print("Highest score is \(Player.highestScore).")
    }
}

let player1 = Player(name: "player1")
let player2 = Player(name: "player2")

player1.play()
player1.play()
player2.play()

//Type Method 类型方法 静态方法
struct Matrix{
    var m: [[Int]]
    let row: Int
    let col: Int
    
    init?( _ arr2d:[[Int]] ){
        guard !arr2d.isEmpty else{
            return nil
        }
        
        let row = arr2d.count
        let col = arr2d[0].count
        for i in 1..<row{
            if arr2d[i].count != col{
                return nil
            }
        }
        
        self.m = arr2d
        self.row = row
        self.col = col
    }
    
    func printMatrix(){
        for i in 0..<row{
            for j in 0..<col{
                print(m[i][j], terminator:"\t")
            }
            print("")
        }
    }
    
    //返回一个线性矩阵
    static func identityMatrix(n: Int) -> Matrix?{
        guard n > 0 else{
            return nil
        }
        
        var arr2d:[[Int]] = []
        for i in 0..<n {
            var row = [Int](repeating: 0, count: n)
            row[i] = 1
            arr2d.append(row)
        }
        
        return Matrix(arr2d)
    }
}

if let m = Matrix([[1,2], [3, 4]]) {
    m.printMatrix()
}

if let e = Matrix.identityMatrix(n: 6){
    e.printMatrix()
}

//Property Observer 属性观察器.
class LightBulb{
    static let maxCurrent = 30 //通过灯泡最大的电流
    var current = 0 { //当前通过的电流
        
        willSet/*(newCurrent)*/ { //willSet将要赋值时 //参数默认newValue
            print("Current value changed. The change is \(abs(current-newValue/*newCurrent*/))")
        }
        
        didSet/*(oldCurrent)*/ { //didSet是已经赋值完成后 //参数默认oldValue
            
            if current == LightBulb.maxCurrent{
                print("Pay attention, the current value get to the maximum point.")
            }
            else if current > LightBulb.maxCurrent{
                print("Current too high, falling back to previous setting.")
                current = oldValue//oldCurrent
            }
            
            print("The current is \(current)")
        }
    }
}

let bulb = LightBulb()
bulb.current = 20
bulb.current = 30
bulb.current = 40 //40已经超过了灯泡的最大负载量.

//属性观察器应用2
enum Theme{
    case DayMode
    case NightMode
}

//注意: didSet和willSet不会在初始化阶段init调用的. *****
class UI{
    //UIColor! 由于类声明时不希望它是nil的, 但是在类在真正初始化之前, 
    //我不清楚themmMode是什么模式, 所以还不能确定fontColor和backgroundColor是什么颜色, 暂时让它们是nil.
    //对于这种情况, 可以用!这种方式.
    //这样在初始化init中就不需要给其赋初值了.
    var fontColor: UIColor!
    var backgroundColor: UIColor!
    var themeMode: Theme = .DayMode{
        didSet{
            self.changeTheme(themeMode: themeMode)
        }
    }
    
    init(themeMode: Theme){
        self.themeMode = themeMode //在init中并不会触发didSet属性观察器. **** 我们需要手动去初始化相关的值.
        changeTheme(themeMode: themeMode)
    }
    
    func changeTheme(themeMode: Theme){
        switch(themeMode){
        case .DayMode:
            fontColor = UIColor.black
            backgroundColor = UIColor.white
        case .NightMode:
            fontColor = UIColor.white
            backgroundColor = UIColor.black
        }
    }
}

let ui = UI(themeMode: .NightMode)
ui //

//延迟加载属性 Lazy Load
class CloseRange { //一个闭区间类
    var start : Int = 0 //存储型属性
    var end : Int = 0
    
    var width : Int{ //计算型属性
        return end - start + 1
    }
    
    //延迟属性只计算一次, 注: lazy不能应用于let常量声明的属性.
    lazy var sum: Int = { //用闭包来计算
        print("start computing sum value")
        
        var res = 0
        for i in self.start...self.end{
            res += i
        }
        return res
    }() //()代表闭包的调用
    
    init?(start : Int, end : Int){
        if start > end {
            return nil
        }
        self.start = start
        self.end = end
    }
}

if let range = CloseRange(start: 0, end: 10_000){
    range.width
    print("==== 延迟性属性只计算一次 ====")
    range.sum
    range.sum
    range.sum
}

class Location{
    let latitude: Double //常量属性
    let longitude: Double
    
    //由于计算经纬度比较耗时, 初始化时, 且只计算一次, 这时就可以用延迟属性, 当用到时只解析一次.
    lazy var address: String? = {
        //执行经纬度解析
        return nil
    }()
    
    init(latitude: Double, longitude: Double){
        self.latitude = latitude
        self.longitude = longitude
    }
}

class Book{
    let name: String
    lazy var content: String? = { //等用户需要时, 再去读取整本书的内容.
        //从本地读取书的内容
        return nil
    }()
    
    init(name: String){
        self.name = name
    }
}

class Web{
    let url: String
    lazy var html: String? = {
        //从网络读取url对应的html
        return nil
    }()
    
    init(url: String){ //当用户点击时,才去加载url代表的html内容.
        self.url = url
    }
}

/***
 * 访问控制 public internal private
 *    public : 指可以被模块外访问的. [当编写SDK供他人使用时]
 *    internal : 可以被本模块访问 [默认]
 *    private : 可以被本文件访问 [编写APP]
 * Sources目录中只能定义, 不能执行语句.
 */
print("==== Swift 访问控制 是以文件为单位的 ====")

//参看 Sources/UI2和APP

let app = App(name: "My First App")
app.show()

app.switchMode()
app.show()

//UI2不是public的, 所以在模块外不能被访问到, 若给UI2加上public时 也必须同时给init函数加上public
//let ui2 = UI2() //error

/***
 * 单例模式
 */
let gameManager = GameManager.defaultGameManager
gameManager.addScore()
gameManager.score

let gameManager2 = GameManager.defaultGameManager
gameManager2.addScore()
gameManager2.score

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
        return "Player" + String(Int(arc4random())%1_000_000)
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

let group: String = "Group"
let player = User(name: "AAA", group: group)
player.name
player.isAlive
player.life
player.score

player.beAttached(attack: 20)
player.life

player.getScore(score: 20)
player.score

let mg = Magician(name: "Harry Portter", group: group)
mg.name
mg.life
mg.isAlive
mg.score
mg.level
mg.magic

//多态
let magician = Magician(name: "Harry Potter", group: group)
let warrior = Warrior(name: "kangqiao", group: group, weapon: "broadsword")

let zombie = Zombie(name: "default zombie1")
let monster = Monster(name: "monster")

func printBasicInfo(avatar: Avatar){
    print("The avatar's name is \(avatar.name)")
    print("The life is \(avatar.life). He is \( (avatar.isAlive) ? "still alive" : "dead")")
    print("========")
}

printBasicInfo(avatar: magician)
printBasicInfo(avatar: warrior)
printBasicInfo(avatar: zombie)
printBasicInfo(avatar: monster)

let avatarArr: [Avatar] = [magician, warrior, zombie, monster]
for avatar in avatarArr{
    avatar.life -= 10
    print(avatar.description)
}

magician.heal(user: magician)
magician.heal(user: warrior)

//重载 => 属性重载, 方法重载.
warrior.life //100
monster.attack(user: warrior, amount: 20)
warrior.life //90 攻击减半.

//两段式构造.
//Swift把构造函数分为两段
//第一段 主要是对没有初值的属性进行初始化,
//      注: 必须先初始化自己没有初值的属性, 然后必须通过super.init()去初始化父类的没有初值的属性.
//          这一步不能使用self相关的属性和方法
//第二段 进一步完善相关属性的值.
//      注: 当子类和父类没有初始化的属性值都初始化后, 这一步才算初始化完成, self可以使用,
//          相关的方法可以调用, 改变其他属性的相关值.

// 便利构造函数和指定构造函数
// 构造函数参数可以有默认值.
// 构造函数是可以被重载的.

/***
 * 构造函数的继承
 */
//用父类Avatar的convenience构造函数初始化User, 同时User也重载了init(name), 所以最终调用的是User子类的init(name)构造函数.
let user = User(firstName: "qiao", lastName: "kang")
user
let monster2 = Monster(name: "zombie")

/***
 * required构造函数.
 *     有些时候在我们设计一个类的时候, 我们知道这个类将来会是一个父类时, 我们认为某些构造函数是非常有用的,
 *     并希望继承它的所有的子类都必须实现这些构造函数, 对此, 我们只需要在父类上把这些构造函数声明成required
 *     当子类实现时, 如果没有写属于自己的构造函数, 那么它是继承了父类的构造函数, 包括required的构造函数.
 *                 如果写了属于自己的构造函数, 子类就必须显示的去实现required的构造函数, 就不能再继承而来了.
 *                 反之如果父类构造函数没有required, 子类是可以通过继承而来的, 同时也可以override重载父类的构造函数.
 *     在子类的实现中 required和override是互斥的, 不能同时存在.
 */

//在结构体中构造函数 重拾
struct Point2{
    var x = 0.0
    var y = 0.0
}
struct Size2{
    var width = 0.0
    var height = 0.0
}

struct Rectangle2{
    var origin = Point()
    var size = Size()
    
    var center: Point{
        get{
            let centerX = origin.x + size.width/2
            let centerY = origin.y + size.height/2
            return Point(x: centerX, y: centerY)
        }
        
        set{
            origin.x = newValue.x - size.width/2
            origin.y = newValue.y - size.height/2
        }
    }
    
    init(origin: Point, size: Size){
        self.origin = origin
        self.size = size
    }
    
    //由于结构体没有继承关系, 所以这里可以直接用self.init去初始化, 不需要convenience
    init(center: Point, size: Size){
        let originX = center.x - size.width/2
        let originY = center.y - size.height/2
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
    
    var area: Double{
        return size.width * size.height
    }
}
