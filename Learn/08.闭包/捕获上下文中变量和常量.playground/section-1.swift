
// 嵌套函数实现
//func makeArray() -> (String)->[String] {
//    
//    var ary:[String] = [String]()
//    
//    func addElement(element:String) -> [String] {
//        ary.append(element)
//        return ary
//    }
//
//    return addElement
//}

// 闭包实现
func makeArray() -> (String)->[String] {
    
    var ary:[String] = [String]()
    
    return  { (element:String) -> [String] in
        ary.append(element)
        return ary
    }
}


let f1 = makeArray()
print("---f1---")
print(f1("张三"))
print(f1("李四"))
print(f1("王五"))

print("---f2---")
let f2 = makeArray()
print(f2("刘备"))
print(f2("关羽"))
print(f2("张飞"))
