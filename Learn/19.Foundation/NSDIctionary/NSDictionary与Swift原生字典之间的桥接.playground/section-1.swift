

import Foundation

let keyString: NSString = "one two three four five"
let keys = keyString.components(separatedBy: " ")

let valueString: NSString = "alpha bravo charlie delta echo"
let values = valueString.components(separatedBy: " ")

let foundationDict = NSDictionary(objects:values, forKeys:keys as [NSCopying])

//NSDictionary转换原生数组[NSObject : AnyObject]
let swiftDict = foundationDict as [NSObject : AnyObject]

print(swiftDict.description)

let key: NSString = "three"
let value = swiftDict[key]
print("three = \(value!)")

for (key, value) in swiftDict {
    print("\(key) - \(value)")
}

//原生数组[NSObject : AnyObject]转换NSDictionary
let dict = swiftDict as NSDictionary
