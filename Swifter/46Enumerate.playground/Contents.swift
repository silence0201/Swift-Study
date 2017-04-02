//: Playground - noun: a place where people can play

import Foundation

let arr: NSArray = [1,2,3,4,5]
var result = 0

arr.enumerateObjects ({ (num, idx, stop) -> Void in
    result += num as! Int
    if idx == 2 {
        stop.pointee = true
    }
})

print(result)

result = 0
for (idx, num) in [1,2,3,4,5].enumerated() {
    result += num
    if idx == 2 {
        break
    }
}
print(result)
