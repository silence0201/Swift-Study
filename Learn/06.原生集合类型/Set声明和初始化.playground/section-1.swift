


let studentList1: Set<String> = ["张三","李四","王五","董六"]
var studentList2 = Set<String>()

let studentList3 = ["张三","李四","王五","董六"]
let studentList4: [String] = ["董六", "张三","李四","王五"]

let studentList5: Set<String> = ["董六", "张三", "李四", "王五"]

if studentList1 == studentList5 {
    print("studentList1 等于 studentList5")
} else {
    print("studentList1 不等于 studentList5")
}

if studentList3 == studentList4 {
    print("studentList3 等于 studentList4")
} else {
    print("studentList3 不等于 studentList4")
}
