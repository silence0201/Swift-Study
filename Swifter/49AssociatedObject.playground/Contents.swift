//: Playground - noun: a place where people can play

import Foundation

class MyClass {
    
}

private var key: Void?

extension MyClass {
    var title: String? {
        get {
            return objc_getAssociatedObject(self, &key) as? String
        }
        set {
            objc_setAssociatedObject(self,
                                     &key, newValue,
                                     .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

        }
    }
}

// 测试
func printTitle(_ input: MyClass) {
    if let title = input.title {
        print("Title: \(title)")
    } else {
        print("没有设置")
    }
}

let a = MyClass()
printTitle(a)
a.title = "Swifter.tips"
printTitle(a)

// 输出：
// 没有设置
// Title: Swifter.tips