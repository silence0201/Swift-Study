


var studentList: [String]  = ["张三","李四","王五"]
print(studentList)

studentList.append("董六")
print(studentList)

studentList += ["刘备", "关羽"]
print(studentList)

studentList.insert("张飞",at:studentList.count)
print(studentList)

let removeStudent = studentList.remove(at: 0)
print(studentList)

studentList[0] = "诸葛亮"
print(studentList)
