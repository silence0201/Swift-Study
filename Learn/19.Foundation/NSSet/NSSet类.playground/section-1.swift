

import Foundation

var weeksArray: NSSet = ["星期一","星期二", "星期三", "星期四"]
weeksArray = weeksArray.adding("星期五") as NSSet
weeksArray = weeksArray.addingObjects(from: ["星期六","星期日"]) as NSSet

var weeksNames = NSSet(set: weeksArray)

for day in weeksArray {
    print(day)
}

print("============")

for day in weeksNames {
    print(day)
}
