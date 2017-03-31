

//示例1
let testscore = 80

var grade: Character

switch testscore {
case 90...100:
    grade = "优"
case 80..<90:
    grade = "良"
case 60..<80:
    grade = "中"
case 0..<60:
    grade = "差"
default:
    grade = "无"
}

print("Grade = \(grade)")


//示例2
var student = (id:"1002", name:"李四", age:32, ChineseScore:80, EnglishScore:89)

var desc: String

switch student {
case (_, _, _, 90...100, 90...100):
    desc = "优"
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
