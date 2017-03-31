


import Foundation

let weeksArray = ["星期一","星期二", "星期三", "星期四", "星期五", "星期六","星期日"]

var weeksNames1 = NSArray(array: weeksArray)
var weeksNames2 = NSArray(objects: "星期一","星期二", "星期三", "星期四", "星期五", "星期六","星期日")


print("星期名字")
print("====   ====")
for i in 0 ..< weeksNames1.count {
    var day = weeksNames1.object(at: i)// 可以使用weeksNames1[i]替换
    print("\(i)     \(day)")
}

print("+++++++++++")
for item in weeksNames2 {
    print("\(item)")
}
