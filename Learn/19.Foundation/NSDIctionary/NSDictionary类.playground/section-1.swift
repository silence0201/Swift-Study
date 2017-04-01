


import Foundation

let keyString: NSString = "one two three four five"
var keys = keyString.components(separatedBy: " ")

let valueString: NSString = "alpha bravo charlie delta echo"
var values = valueString.components(separatedBy: " ")

var dict = NSDictionary(objects: values, forKeys: keys as [NSCopying])

print(dict.description)

var value = dict["three"]

print("three = \(value)")

var allkeys = dict.allKeys

for key in allkeys {
    print("\(key) - \(dict[key])")
}
