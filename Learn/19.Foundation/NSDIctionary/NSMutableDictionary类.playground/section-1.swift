

import Foundation

var mutable = NSMutableDictionary(capacity: 1)

mutable.setValue("Tom", forKey: "tom@jones.com")
mutable.setObject("Bob", forKey: "bob@dole.com" as NSCopying)

print(mutable.description)

var keys = mutable.allKeys

for key in keys {
    print("\(key) - \(mutable[key])")
}
