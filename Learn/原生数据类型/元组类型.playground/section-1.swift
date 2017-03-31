


var student1 = ("1001", "张三", 30, 90)
print("学生:\(student1.1) 学号:\(student1.0) 英语成绩:\(student1.2) 语文成绩:\(student1.3)")

var student2 = (id:"1002", name:"李四", english_score:32, chinese_score:80)
print("学生:\(student2.name) 学号:\(student2.id) 英语成绩:\(student2.english_score) 语文成绩:\(student2.chinese_score)")

let (id1, name1,englishScore,chineseScore) = student1

print("学生:\(name1) 学号:\(id1) 英语成绩:\(englishScore) 语文成绩:\(chineseScore)")

let (id2, name2,_,_) = student2

print("学生:\(name2) 学号:\(id2)")
