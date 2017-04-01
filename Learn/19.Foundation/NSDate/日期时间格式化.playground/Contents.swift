
import Foundation

// 创建当前时刻对象
let now = Date()
print(now)

let formatter = DateFormatter()
formatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"

// Date转换为字符串
let dateString = formatter.string(from: now)
print(dateString)

formatter.dateFormat = "yyyy-MM-dd"
let birthdayString = "1973-12-08"
// 字符串转换为Date
let birthday = formatter.date(from: birthdayString)
print(birthday!)
