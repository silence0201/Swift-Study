

var studentList: Set<String> = ["张三","李四","王五"]
print(studentList)

let removeStudent = studentList.removeFirst()
print(studentList)
print(removeStudent)

studentList.insert("董六")
print(studentList)

let student = "张三"

studentList.remove(student)
print(studentList)

if !studentList.contains(student) {
    print("删除学生:\(student)成功。")
} else {
    print("删除学生:\(student)失败！")
}

print("Set集合长度:\(studentList.count)")
