//: Playground - noun: a place where people can play

import Foundation

class MyObject: NSObject {
    func callMe() {
        
    }
    
    func callMeWithParm(obj: AnyObject) {
        
    }
    
    func trun(by angle: Int, speed: Float) {
        
    }
    
    func selecotrs() -> [Selector] {
        let someMethod = #selector(callMe)
        let anotherMethod = #selector(callMeWithParm(obj:))
        let method = #selector(trun(by:speed:))
        
        return [someMethod, anotherMethod, method]
    }
    
    func otherSelector() -> [Selector] {
        let someMethod = #selector(callMe)
        let anotherMethod = #selector(callMeWithParm)
        let method = #selector(trun)
        
        return [someMethod, anotherMethod, method]
    }
    
    func commonFunc() {
        
    }
    
    func commonFunc(input: Int) -> Int {
        return input
    }
    
    func sameNameSelector() -> [Selector] {
        let method1 = #selector(commonFunc as () -> Void)
        let method2 = #selector(commonFunc as (Int) -> Int)
        
        return [method1, method2]
    }
}

let selectors = MyObject().selecotrs()
print(selectors)

let otherSelectors = MyObject().otherSelector()
print(otherSelectors)

let sameNameSelectors = MyObject().sameNameSelector()
print(sameNameSelectors)
