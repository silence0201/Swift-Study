


var studentDictionary = [102 : "张三",105 : "李四", 109 : "王五"]

studentDictionary[110] = "董六"

print("班级人数：\(studentDictionary.count)")

let dismissStudent = studentDictionary.removeValue(forKey: 102)

print("开除的学生：\(dismissStudent!)")

studentDictionary[105] = nil

studentDictionary[109] = "张三"

let replaceStudent = studentDictionary.updateValue("李四", forKey:110)
print("被替换的学生是：\(replaceStudent!)")
