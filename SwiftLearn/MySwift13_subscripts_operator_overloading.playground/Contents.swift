//: Playground - noun: a place where people can play

import UIKit

/**
 Swift_subscripts_operator_overloading
 */
var arr = [0,1,2,3]
arr[1]

var dict = ["北京":"Beijing", "纽约":"New York", "巴黎":"Paris"]
dict["北京"]


struct Vector3{
    
    var x:Double = 0.0
    var y:Double = 0.0
    var z:Double = 0.0
    
    subscript(index:Int) -> Double?{
        
        get{
            switch index{
            case 0: return x
            case 1: return y
            case 2: return z
            default: return nil
            }
        }
        
        /// 默认新值是newValue, 其类型与get的返回类型相同
        set{
            guard let newValue = newValue else{ return }
            
            switch index{
            case 0: x = newValue
            case 1: y = newValue
            case 2: z = newValue
            default: return
            }
        }
    }
    
    subscript(axis:String) -> Double?{
        
        get{
            switch axis{
            case "x","X": return x
            case "y","Y": return y
            case "z","Z": return z
            default: return nil
            }
        }
        
        set{
            guard let newValue = newValue else{ return }
            
            switch axis{
            case "x","X": x = newValue
            case "y","Y": y = newValue
            case "z","Z": z = newValue
            default: return
            }
        }
    }
    
    //返回向量的模
    func lenght() -> Double{
        return sqrt(x * x + y * y + z * z)
    }
}

var v = Vector3(x: 1.0, y: 2.0, z: 3.0)
v.x
let xxx = v[0]  //xxx is Double?
let aaa = v[100] //aaa is nil

v["z"]
v["Y"]
v["Hello"]

v[0] = 100.0
v["Y"] = 30
v

///Swift支持有任意多个参数的下标.
struct Matrix{
    
    var data:[[Double]]
    let r:Int
    let c:Int
    
    init(row:Int, col:Int){
        self.r = row
        self.c = col
        data = [[Double]]()
        for _ in 0..<r{
            let aRow = Array(repeating: 0.0, count: col)
            data.append(aRow)
        }
    }
    
    //m[1,1]
    subscript(x: Int, y: Int) -> Double{
        
        get{
            assert( x >= 0 && x < r && y >= 0 && y < c , "Index Out of Range")
            return data[x][y]
        }
        
        set{ //内置函数 assert
            assert( x >= 0 && x < r && y >= 0 && y < c , "Index Out of Range")
            data[x][y] = newValue
        }
    }
    
    // 如果想使用 m[1][1]
    subscript(row: Int) -> [Double]{
        
        get{
            assert( row >= 0 && row < r , "Index Out of Range")
            return data[row]
        }
        
        set(vector){ //newValue应该是get的返回值类型
            assert( vector.count == c , "Column Number does NOT match")
            data[row] = vector
        }
    }
}

var m = Matrix(row: 2, col: 2)
//m[2,2] //EXC_BAD_INSTRUCTION
m[1,1]


// 如果想使用 m[1][1]
m[1][1]
m[1]

m[0] = [1.5,4.5]
m[0][0]
m[0][1]


// 更多关于assert，留在错误处理进行讲解


// 对于下标的使用
// 实现魔方
// 实现数据结构，如链表
// 实现数据Table，等等等等

//运算符重载, 运算符本质就是函数. *** = 等号是不能被重载的, 是由系统所保留的, 因为它在低层是内存管理相关的.
//重载的运算符函数要定义在结构外面.
func + (left: Vector3, right: Vector3) -> Vector3{
    return Vector3(x: left.x + right.x, y: left.y + right.y, z: left.z + right.z)
}

var va = Vector3(x: 1.0, y: 2.0, z: 3.0)
let vb = Vector3(x: 3.0, y: 4.0, z: 5.0)
va + vb
func - (left: Vector3, right: Vector3) -> Vector3{
    return Vector3(x: left.x - right.x, y: left.y - right.y, z: left.z - right.z)
}
va - vb
//内积
func * (left: Vector3, right: Vector3) -> Double{
    return left.x * right.x + left.y * right.y + left.z * right.z
}
va * vb

func * (left: Vector3, a: Double) -> Vector3{
    return Vector3(x: left.x * a, y: left.y * a, z: left.z * a)
}
va * -1.0

func * (a: Double, right: Vector3) -> Vector3{
    return right * a
}
-1.0 * va

//left必须inout, 返回值就不需要了.
func +=( left: inout Vector3, right: Vector3){
    left = left + right
}
va += vb

//-号加了prefix, 只能用在前面.
prefix func - (vector: Vector3) -> Vector3{
    return Vector3(x: -vector.x, y: -vector.y, z: -vector.z)
}
-va

//比较运算符的重载
func == (left: Vector3, right: Vector3) -> Bool{
    return left.x == right.x && left.y == right.y && left.z == right.z
}
va == vb

func != (left: Vector3, right: Vector3) -> Bool{
    return !(left == right)
}
va != vb

func < (left: Vector3, right: Vector3) -> Bool{
    if left.x != right.x{ return left.x < right.x}
    if left.y != right.y{ return left.y < right.y}
    if left.z != right.z{ return left.z < right.z}
    
    return false
}
va < vb

func <= (left: Vector3, right: Vector3) -> Bool{
    return left < right || left == right
}

func > (left: Vector3, right: Vector3) -> Bool{
    return !(left <= right)
}

func >= (left: Vector3, right: Vector3) -> Bool{
    return !(left < right)
}

let a = [2, 3, 1, 5]
a.sorted(by: >)

//自定义的运算符重载 
// Custom operators can begin with one of the ASCII characters 
// ASCII characters /, =, -, +, !, *, %, <, >, &, |, ^, ~, or with one of the Unicode characters
//自定义单目运算符
postfix operator +++ //声明+++将会是一个单目运算符
postfix func +++ ( vector: inout Vector3) -> Vector3 {
    vector += Vector3(x: 1.0, y: 1.0, z: 1.0)
    return vector
}
va+++

//前置的+++操作
prefix operator +++
prefix func +++( vector: inout Vector3) -> Vector3{
    let ret = vector
    vector += Vector3(x: 1.0, y: 1.0, z: 1.0)
    return ret
}

+++va
va

//双目运算符 
//associativity 结合性, 左结合
//precedence 优先级[0~255] 默认是140, 140是与加法平行的优先级,
//infix operator ^{associativity left precedence 140} //swift2
infix operator ^: AAA
precedencegroup AAA {
    associativity: left
    higherThan: AdditionPrecedence
    lowerThan: MultiplicationPrecedence
}
func ^ (left: Vector3, right: Vector3) -> Double{
    return acos( (left * right) / (left.lenght() * right.lenght()) )
}
va ^ vb

//优先级设置参考Swift官方文档 乘法优先级是150
//infix operator **{associativity right precedence 155} //swift2
infix operator **: BBB
precedencegroup BBB{
    associativity: left
    higherThan: AdditionPrecedence
    lowerThan: MultiplicationPrecedence
}
func **(x: Double, p:Double) -> Double{
    return pow(x, p)
}

2**3
2 ** 3 ** 2 //因为associativity结合性是右结合, 所以先计算3**2=9, 再计算2**9=512
1+2 ** 3 ** 2
5*2 ** 3 ** 2



