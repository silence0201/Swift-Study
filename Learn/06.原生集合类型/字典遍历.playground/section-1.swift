

var studentDictionary = [102 : "张三",105 : "李四", 109 : "王五"]

print("---遍历键---")
for studentID in studentDictionary.keys {
    print("学号：\(studentID)")
}

print("---遍历值---")
for studentName in studentDictionary.values {
    print("学生：\(studentName)")
}

print("---遍历键:值---")
for (studentID, studentName) in studentDictionary {
    print ("\(studentID) : \(studentName)")
}
