//: Playground - noun: a place where people can play

public class SomePublicClass {}
internal class SomeInternalClass {}
fileprivate class SomeFilePrivateClass {}
private class SomePrivateClass {}

public var SomePublicVar = 0
internal let someInternalConstt = 0
fileprivate func someFilePrivateFunction() {}
private func somePrivateFunction() {}

class SomeImplictlyInternalClass {}
let someImplicityInternalConstant = 0

public class AnotherPublicClass{
    public var somepublicProperty = 0
    var someInternalproperty = 0
    private func somePrvateMethod() {}
}

class AnotherInternalClass{
    var someInternalProerty = 0
    private func somePrivateMethod() {}
}

fileprivate class AnotherFilePrivateClass{
    func someFilePrivateMethod() {}
    private func somePrivateMethod() {}
}

private class AnotherPrivateClass{
    var somePrivateProperty = 0
    func somePrivateMethod() {}
}

private func someFunction() -> (SomeInternalClass,SomeInternalClass){
    return (SomeInternalClass(),SomeInternalClass())
}

private enum CompassPoint{
    case north
    case south
    case east
    case west
}

public class A{
    fileprivate func someMethod() {}
}

internal class B : A{
    fileprivate override func someMethod() {}
}

public class C {
    fileprivate func someMethod() {}
}
internal class D: C {
    override internal func someMethod() {
        super.someMethod()
    }
}

private var privateInstance = SomePrivateClass()

struct TrackedString {
    private(set) var numberOfEdits = 0
    var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
}

var stringToEdit = TrackedString()
stringToEdit.value = "This string will be tracked."
stringToEdit.value += " This edit will increment numberOfEdits."
stringToEdit.value += " So will this one."
print("The number of edits is \(stringToEdit.numberOfEdits)")
stringToEdit.numberOfEdits
