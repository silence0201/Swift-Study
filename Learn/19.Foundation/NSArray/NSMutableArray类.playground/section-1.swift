

import Foundation

var weeksNames = NSMutableArray(capacity: 3)

weeksNames.add("星期一")
weeksNames.add("星期二")
weeksNames.add("星期三")
weeksNames.add("星期四")
weeksNames.add("星期五")
weeksNames.add("星期六")
weeksNames.add("星期日")

print("星期名字")
print("====   ====")
for i in 0 ..< weeksNames.count {
    var day = weeksNames[i]
    print("\(i)     \(day)")
}

print("+++++++++++")
for item in weeksNames {
    print("\(item)")
}

