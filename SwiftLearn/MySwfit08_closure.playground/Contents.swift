//: Playground - noun: a place where people can play

import UIKit

/*** 闭包 Closure **/
//OC中的Block 基本等于 Swfit中的Closure

var arr:[Int] = []
for _ in 0..<10{
    arr.append(Int(arc4random()) % 1000) //swift3 arc4random() % 求余运算只能处理整数.
}

func biggerNumberFirst(a:Int, _ b:Int)->Bool{
    return a > b
}

arr.sorted(by: biggerNumberFirst)
arr

//闭包相当于匿名函数. 不用写函数名, 直接()写参数 ->后写返回值 in后写函数体
arr.sorted(by: { (a:Int, b:Int) -> Bool in
    return a > b
})
//闭包可以写在一行中
arr.sorted(by: { (a:Int, b:Int) -> Bool in return a > b})

//因为数组的sort函数接收的函数型参数是(Int, Int) -> Bool 类型的, 我们只要在in之前指定固定的参数 return 逻辑体的返回类型.
arr.sorted(by: {a, b in return a > b})

arr.sorted(by: {a, b in a > b})

arr.sorted(by: {$0 > $1}) //$0代表第一个参数, $1代表第二个参数. 不建议使用这种简练的写法, 因为语义不明确了.

arr.sorted(by: >) //Swift中 > 大于号 本身就是一个函数

//注: 如果需要的函数参数是无参无返回值的 可以直接在{}中写闭包体.
func test(_ closuer:()->()){
    closuer()
}
test({print("This is closure without param and return")})

/*** Trailing Closure 函数的最后一个参数是一个函数参数**/
arr.sort(){a, b in return a > b} //这好像就是Java中函数中传入匿名函数一样.

arr.sort{a, b in return a > b}

//将数组中的每一个整数 都 转换 成二进制的字符串.
//注: 显示var指定number是一个可变量, 这样在函数闭包体中就可以改变它了. //swift2
let arrMap = arr.map{ ( number) -> String in
    var number = number //swift3
    var res = ""
    repeat{
        res = String(number%2) + res
        number /= 2
    }while number != 0
    return res
}
arrMap
arr

import XCPlayground
import PlaygroundSupport

//IOS开发中每一屏的界面都会有一个UIView, CGRect类型的参数frame 决定了视图的位置和大小.
let showView = UIView(frame: CGRect(x:0, y:0, width: 300, height:300))
//创建另一个小的UIView.
let rectangle = UIView(frame: CGRect(x:0, y:0, width: 50, height: 50))
//设置rectangle的center和showView保持相等.
rectangle.center = showView.center
rectangle.backgroundColor = UIColor.red

//将rectangle加入到showView中.
showView.addSubview(rectangle)

//设置加载动画.
UIView.animate(withDuration: 2.0, animations: {
    rectangle.backgroundColor = UIColor.blue
    rectangle.frame = showView.frame
})

//XCPlaygroundPage 加载 showView.
//XCPlaygroundPage.currentPage.liveView = showView //swift2
PlaygroundPage.current.liveView = showView //swift3

/*** 内容捕获 **/
arr.sort{a, b in
    abs(a-500) < abs(b-500)
}
//上例中500是固定的, 而sort函数接收的闭包函数只有两个参数, 不能插入第三个参数. 这时就需要闭包的内容捕获
var num = 700
arr.sort{a, b in
    abs(a-num) < abs(b-num) //闭包可以捕获了num这个值. 这个特性有可能会产生内存问题.
}

//注: 闭包和函数是引用类型
//返回值是一个 ()->Int 类型的闭包函数.
//函数的意义是输入你每天跑步的米数, 然后每调用一次函数返回的闭包就累加计记录下来并保存在函数的totalMeters中.
func runningMetersWithMetersPerDay(metersPerDay:Int)-> ()->Int{
    var totalMeters = 0
    //函数返回一个闭包.
    return {
        totalMeters += metersPerDay //返回的闭包捕获了totalMeters.
        print("totalMeters = ", totalMeters)
        return totalMeters
    }
}

print("====PlanA====")
//由于函数在此被调用了, 其中的声明的totalMeters被返回的闭包所捕获, 其值就被保留下来并为返回的闭包planA所一直使用
var planA = runningMetersWithMetersPerDay(metersPerDay: 2000)
planA() //当每次调用planA时, 其实是在调用函数调用时返回的闭包.
planA()
planA()

print("====PlanB====")
//当重新调用函数runningMetersWithMetersPerDay时, 函数中的totalMeters就对返回的闭包函数所捕获,并被其一直使用.
var planB = runningMetersWithMetersPerDay(metersPerDay: 5000)
planB()
planB()

print("----AnotherPlan----")
var anotherPlan = planB //引用赋值
anotherPlan()

planB() //这说明planB传递给anotherPlan时引用传递. 并不是值拷贝传递.

print("====PlanC====")
//planC虽然声明为常量, 但是planC只是引用了函数返回的闭包, 它的let只是表示planC只能引用函数返回的闭包了, 不能为planC再次赋于其他的闭包或函数了.
let planC = runningMetersWithMetersPerDay(metersPerDay: 3000)
planC()
planC()
















