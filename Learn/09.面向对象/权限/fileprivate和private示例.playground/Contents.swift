
///同一个文件
class ClassA {
    //private 会有编译错误
    fileprivate var name: String {
        return ""
    }
}

class ClassB : ClassA {
    override var name: String {
        return "Tony"
    }
}
