

var str = "Objective-C and Swift"
print("原始字符串：\(str)")

//插入字符
str.insert(".", at: str.endIndex)
print("插入.字符后：\(str)")

str.remove(at: str.index(before: str.endIndex))
print("删除.字符后：\(str)")

var startIndex = str.startIndex
var endIndex = str.index(startIndex, offsetBy: 9)

var range = startIndex...endIndex
//删除范围
str.removeSubrange(range)
print("删除范围后：\(str)")

startIndex = str.startIndex
endIndex = str.index(startIndex, offsetBy: 0)
range = startIndex...endIndex

//替换范围
str.replaceSubrange(range, with: "C++")
print("替换范围后：\(str)")
