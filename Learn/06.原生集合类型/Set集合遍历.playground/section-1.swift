
var studentList: Set<String>  = ["张三","李四","王五"]

for item in studentList {
    print(item)
}

for (index, value) in studentList.enumerated() {
    print("Item \(index + 1 ) : \(value)")
}
