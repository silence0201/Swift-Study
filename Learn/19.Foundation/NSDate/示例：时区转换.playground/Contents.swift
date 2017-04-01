
import Foundation

let formatter = DateFormatter()
formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

extension Date {
    
    var toLocalTime: String {
        
        let timeZone = NSTimeZone.local
        let seconds = TimeInterval(timeZone.secondsFromGMT(for: self))
        
        let date = Date(timeInterval: seconds, since: self)
        let dateString = formatter.string(from: date)
        
        return dateString
    }
    
    var toUTCTime: String {
        
        let timeZone = NSTimeZone.local
        let seconds = -1 * TimeInterval(timeZone.secondsFromGMT(for: self))
        
        let date = Date(timeInterval: seconds, since: self)
        let dateString = formatter.string(from: date)
        
        return dateString
    }
}

let birthdayString = "1973-12-08 20:53:21"
let birthday = formatter.date(from: birthdayString)

print(birthdayString)
//birthdayString - 8小时
print("UTC时间:\(birthday!.toUTCTime)")
//birthdayString + 8小时
print("本地时间:\(birthday!.toLocalTime)")

