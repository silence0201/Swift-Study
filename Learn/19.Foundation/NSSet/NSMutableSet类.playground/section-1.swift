

import Foundation

var weeksNames = NSMutableSet(capacity: 3)

weeksNames.add("星期一")
weeksNames.add("星期二")
weeksNames.add("星期三")
weeksNames.add("星期四")
weeksNames.add("星期五")
weeksNames.add("星期六")
weeksNames.add("星期日")

print("星期名字")
print("====   ====")

for day in weeksNames {
    print(day)
}

var A: NSMutableSet = ["a","b","e","d"]
var B: NSMutableSet = ["d","c","e","f"]

A.minus(B as Set<NSObject>)
print("A与B差集 = \(A)")//[b, a]

A.union(B as Set<NSObject>)
print("A与B并集 = \(A)")//[ d,b,e,c,a,f]
