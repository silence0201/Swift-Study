//: Playground - noun: a place where people can play

import UIKit

/*** Swift 函数 **/

func sayHello(name:String?) -> String{
    return "Hello " + (name ?? "Guest")
}

sayHello(name: "kangqiao")
sayHello(name: nil)

func printHello1(){ //函数没有参数, 没有返回值
    print("Hello1")
}
printHello1()

func printHello2() -> (){ //显示指定没有返回值 ()
    print("hello2")
}
printHello2()

func printHello3() -> Void{
    print("hello3")
}
printHello3()

var arr = [1, 2, 3]
arr.append(4)
arr.contains(1)
arr.index(of: 3) //swift3
arr.remove(at: 2) //swfit3
arr
var str : NSString = "1234"
//str.stringByTrimmingCharactersInSet(Set<Character>(["1","4"]))

func findMaxAndMin(numbers:[Int]) -> (max:Int, min:Int)? { //给元组命名分量的名字.
//    if numbers.isEmpty{
//        return nil
//    }
    guard numbers.count > 0 else{
        return nil
    }
    
    var minValue = numbers[0]
    var maxValue = numbers[0]
    for number in numbers{
        minValue = minValue < number ? minValue : number
        maxValue = maxValue > number ? maxValue : number
    }
    return (max: maxValue, min:minValue)
}

var scores : [Int]? = [202, 123, 2345, 232, 89, 5555] //若从网络返回时, scores可能是nil.
scores = scores ?? [] //当使用可选型时, 进行解包.若为nil时, 默认指定为[]空数组.
if let result = findMaxAndMin(numbers: scores!){ //上一行已经进行解包,设置初值空数组, 所以这里用!号强制解包使用.
    print("The max score is \(result.max)")
    print("The min score is \(result.min)")
}

func sayHelloTo(name: String, greeting:String) -> String{
    return "\(greeting), \(name)"
}

//*** swift2函数调用时, 第一个参数可以不用写参数名, 第二个参数开始必须写参数名 *** //swift2
//sayHelloTo("Playground", greeting: "hello") //swift2 error
//*** swift3函数调用时, 参数<必须>写参数名 *** //swift3
sayHelloTo(name: "Playground", greeting: "hello")

var str1 = "hello, palyground"
//str1.replaceRange(str1.startIndex..<str1.startIndex.advancedBy(5), with: "Hi") //swfit2
//str1.replaceSubrange(bounds: str1.startIndex..<str1.index(str1.startIndex, offsetBy: 5) , with: "Hi"); //swift3
//str1.stringByReplacingOccurrencesOfString("Hi", withString: "Morning") //swift2
str1.replacingOccurrences(of: "Hi", with: "Morning") //swift3

//*** swift3 函数参数全名, 外部参数名与内部参数名, 同时保证函数体内与调用者的语义明确
//swift3第一个参数同其他的参数一样, 遵循外部参数名和内部参数名, 不写外部参数名, 调用时, 就用内部参数, 写了外部参数名, 调用时, 就必须用
//定义时, 指定参数的默认值, 则调用时, 可不给赋值.
//swift3 在调用时所有参数必须按顺序调用.
//建议将有默认值的参数放在函数参数列表的后面.
func sayHelloTo2(to name: String, greeting:String = "Hello"
    , punctuation:String = "!") -> String{
    return "\(greeting), \(name) \(punctuation)"
}

//函数定义时, 若指定了外部参数名, 则调用时, 必须使用外部参数名
sayHelloTo2(to: "Playground", greeting: "hello")
//error: argument 'to' must precede argument 'withGreetingWord'
sayHelloTo2(to: "Playground", greeting: "hello", punctuation: "Hi") //swift3中参数必须按顺序调用
sayHelloTo2(to: "kangqiao") //必须指定外部参数名"to"

func mutipleOf(num1: Int, and num2: Int) -> Int{
    return num1 * num2
}
//*** swift函数调用时, 第一个参数可以不用写外部参数名, 第二个参数开始必须写参数名 ***
mutipleOf(num1: 4, and: 2)

//使用下划线忽略参数的外部名
func mutiply(num1: Int, _ num2: Int) -> Int{
    return num1 * num2
}
mutiply(num1: 4, 3)

func sayHelloTo3(name: String = "playground", withGreetingWord greeting:String = "Hello"
    , punctuation:String = "!") -> String{
        return "\(greeting), \(name) \(punctuation)"
}
sayHelloTo3() //无参数调用
sayHelloTo3(name: "kang", withGreetingWord: "Hi", punctuation: "...") //swift3参数必须按顺序调用
sayHelloTo3(name: "Kang") //只指定第一个参数.

print("Hello", 1, 2, 3, 4, "hi", separator:", ", terminator:"++")
print("")

//变长参数类型的函数
func mean(numbers: Double ...) -> Double{
    var sum: Double = 0
    
    //将变长参数当做一个数组看待
    for number in numbers{
        sum += number
    }
    
    return sum/Double(numbers.count)
}

mean(numbers: 2)
mean(numbers: 2, 3)
mean(numbers: 2, 5, 6, 77, 99, 90)

//变长参数的应用.
func sayHelloTo4( names:String ... , withGreetingWord greeting:String, punctuation:String){
    for name in names{
        print("\(greeting), \(name) \(punctuation)")
    }
}
sayHelloTo4(names: "A", "B", "C", withGreetingWord: "Hi", punctuation: "!!!")

//函数的参数定义时默认是let修饰为常量, 不能在函数体中改变它. 若想改变它, 则显示用var修饰. //swift2
func toBinary( num: Int) -> String{ //swift3 中参数不能用var修饰了, 若要在内部使用它, 在函数开头声明为var, 若要影响它, 则用inout
    var num = num
    var res = ""
    repeat{
        res = String(num % 2) + res
        num /= 2
    }while num != 0
    return res
}

toBinary(num: 12)

var p = 100
toBinary(num: p) //1100100
p //100 x并没有因为调用toBinary函数而被改变.

//交换参数的值, 但是这样并不会真正的交换函数调用外的变量的值.
func swapTwoInts( a: Int, _ b: Int){
    var a = a
    var b = b
    let t: Int = a
    a = b
    b = t
}

var x: Int = 1
var y: Int = 2
swapTwoInts(a: x, y)
print(x)
print(y)

//函数的引用传递 inout
func swapTwoInts2( a: inout Int, _ b: inout Int){ //swift3中 inout作为类型修饰, 放在:冒号后面.
//    let t: Int = a
//    a = b
//    b = t
    (a,b)=(b,a) //利用元组进行数据的交换.
}
swapTwoInts2(a: &x, &y) //使用x和y的引用传递.
print("swapTwoInts2 after x" , x)
print("swapTwoInts2 after y", y)

//Swift中的参数默认是传值, 若要改变参数在函数体外的实际值, 必须使用inout.
func initArray(arr: inout [Int], by value: Int){
    for i in 0..<arr.count{
        arr[i] = value
    }
}
var arr2 = [1, 2, 3, 4]
initArray(arr: &arr2, by: 0)
arr2

/*** 函数型变量 **/
func add( a: Int, _ b: Int) -> Int{
    return a + b
}
let anotherAdd = add //函数型变量, 将函数传递给变量anotherAdd变量.
anotherAdd(3, 4)
let anotherAdd2: (Int, Int)->Int = add //声明函数型变量的类型, 其由(参数元组) -> 返回值 组成.
anotherAdd2(3, 4)

func sayHelloTo5(name:String){ //没有返回值的函数.
    print("hello, \(name)")
}
let anotherSayHelloTo5: (String)->Void = sayHelloTo5
anotherSayHelloTo5("kang qiao") //"hello, kang qiao"

func sayHello6(){ //空的参数和空的返回值 的 类型函数.
    print("hello")
}
/*** swift3 中规定函数的类型 参数列表必须用括号 **/
let anotherSayHello61 = sayHello6
let anotherSayHello62: ()->() = sayHello6
let anotherSayHello63: (Void)->() = sayHello6
let anotherSayHello64: (Void)->Void = sayHello6
let anotherSayHello65: (Void)->Void = sayHello6

/*** 对数组进行排序 **/
var arr3:[Int] = []
for _ in 0..<100{
    arr3.append(Int(arc4random()) % 1000)
}
arr3
arr3.sort() //排序函数.
arr3

//从大到小的排序比较器.
func biggerNumberFirst(a: Int, _ b:Int) -> Bool{
    return a > b
}
arr3.sorted(by: biggerNumberFirst) //swfit3

//按字典序排序.
func cmpByNumberString(a:Int, _ b:Int) -> Bool{
    return String(a) < String(b)
}
arr3.sorted(by: cmpByNumberString)

//按靠近500的距离排序.
func near500(a:Int, _ b: Int)->Bool{
    return abs(a - 500) < abs(b-500)
}
arr3.sorted(by: near500)

/***
 * 函数式编程初步 -- 高阶函数
 **/
//对每一个分数开平方再乘以10
func changeScores1( scores:inout [Int] ) {
    for (index , score) in scores.enumerated(){
        scores[index] = Int(sqrt(Double(score)) * 10)
    }
}
//对每一个分数 150分按百分制计录.
func changeScores2( scores:inout [Int]){
    for (index, score) in scores.enumerated(){
        scores[index] = Int(Double(score) / 150.0 * 100.0)
    }
}

var scores1 = [36, 61, 78, 89, 99]
changeScores1(scores: &scores1)

var scores2 = [88, 101, 124, 137, 150]
changeScores2(scores: &scores2)

//高阶函数式编程 ***
func changeScoresss( scores:inout [Int], by changeScore: (Int)->Int){
    for (index, score) in scores.enumerated(){
        scores[index] = changeScore(score)
    }
}
func changeScore111(score:Int)->Int{
    return Int(sqrt(Double(score))*10)
}
func changeScore222(score:Int)->Int{
    return Int(Double(score)/150.0*100.0)
}
var scores111 = [36, 61, 78, 89, 99]
changeScoresss(scores: &scores111, by:changeScore111)
var scores222 = [88, 101, 124, 137, 150]
changeScoresss(scores: &scores222, by:changeScore222)

// Map 操作 
var scores333 = [36, 61, 78, 89, 99]
scores333.map(changeScore111)
func isPassOrFail(score:Int)->String{
    return score < 60 ? "Fail" : "Pass"
}
scores333.map(isPassOrFail)
scores333

// filter 操作
func fail(score:Int)->Bool{ //过滤不及格的分数.
    return score < 60
}
scores333.filter(fail)

// reduce 操作
func addd(num1:Int, _ num2: Int) -> Int{
    return num1 + num2
}
//第一个参数: 初值 , 第二个参数接合: 函数式参数.
scores333.reduce(0, addd)
scores333.reduce(0, +)

//将数组中的数据 以字符串的形式 接合在一起.
func concatenate( str: String, num: Int) -> String{
    return str + String(num) + " "
}
scores333.reduce("", concatenate)

/*** 返回函数类型 和函数嵌套 **/
func tier1MailFeeByWeight(weight:Int)->Int{ //1块钱
    return 1 * weight
}

func tier2MailFeeByWeight(weight:Int)->Int{ //3块钱
    return 3 * weight
}

func feeByunitPrice(price:Int, weight:Int) -> Int{
    //函数的嵌套. 作用是仅将chooseMailFeeCalculationByWeight暴露给函数feeByunitPrice使用.
    func chooseMailFeeCalculationByWeight(weight:Int) -> (Int)->Int{
        //如果weight 小于 10 使用 起价1函数, 否则起价2函数.
        return weight <= 10 ? tier1MailFeeByWeight : tier2MailFeeByWeight
    }
    
    let mailFeeByWeight = chooseMailFeeCalculationByWeight(weight: weight) //根据重量摆选择起价函数.
    return mailFeeByWeight(weight) + price * weight //计算总价.
}









