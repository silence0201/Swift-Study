

import Foundation
import ModuleA

///模块B
class ClassB : ClassA {
    public override func printName() {
        print(name)
    }
}

print("Hello, World!")
