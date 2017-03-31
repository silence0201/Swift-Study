

var student = (id:"1002", name:"李四", age:32, ChineseScore:90, EnglishScore:91)

var desc: String

switch student {
case (_, _, let AGE, 90...100, 90...100):
    if (AGE > 30) {
        desc = "老优"
    } else {
        desc = "小优"
    }
case (_, _, _, 80..<90, 80..<90):
    desc = "良"
case (_, _, _, 60..<80, 60..<80):
    desc = "中"
case (_, _, _, 60..<80, 90...100), (_, _, _, 90...100, 60..<80):
    desc = "偏科"
case (_, _, _, 0..<80, 90...100), (_, _, _, 90...100, 0..<80):
    desc = "严重偏科"
default:
    desc = "无"
}

print("说明：\(desc)")

