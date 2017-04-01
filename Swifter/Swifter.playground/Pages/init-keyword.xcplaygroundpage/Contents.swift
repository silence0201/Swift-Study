

import Foundation

class ClassA {
    let numA: Int
    required init(num: Int) {
        numA = num
    }
    
    init() {
        numA = 0
    }
    
    convenience init(bigNum: Bool) {
        self.init(num: bigNum ? 10000 : 1)
    }
}

class ClassB: ClassA {
    let numB: Int
    
    required init(num: Int) {
        numB = num + 1
        super.init(num: num)
    }
    
    override init() {
        numB = 0
        super.init()
    }
}

let anObj = ClassB(bigNum: true)
// anObj.numA = 10000, anObj.numB = 10001
