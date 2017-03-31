
import Foundation

//自定义错误类型
enum DAOError: Error {
    case noData
    case primaryKeyNull
}

//日期格式对象
var dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

let dao = NoteDAO()

//查询所有数据
do {
    try dao.findAll()
} catch DAOError.noData {
    print("没有数据。")
    
    //准备要插入的数据
    var date1 = dateFormatter.date(from: "2017-01-01 16:01:03")!
    var note1 = Note(date:date1, content: "Welcome to MyNote.")
    var date2 = dateFormatter.date(from: "2017-01-02 8:01:03")!
    var note2 = Note(date:date2, content: "欢迎使用MyNote。")
    //插入数据
    dao.create(note1)
    dao.create(note2)
}


do {
    var note = Note(date:nil, content: "Welcome to MyNote.")
    try dao.remove(note)
} catch DAOError.primaryKeyNull {
    print("主键为空。")
}

func printNotes() throws {
    
    let datas  = try dao.findAll()
    for note in datas {
        print("date : \(note.date!) - content: \(note.content!)")
    }
}

try printNotes()
