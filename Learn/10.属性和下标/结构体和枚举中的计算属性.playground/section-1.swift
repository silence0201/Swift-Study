

struct Department {
    let no: Int = 0
    var name: String = "SALES"
    
    var fullName: String {
        return "Swift." + name + ".D"
    }
}

var dept = Department()
print(dept.fullName)

enum WeekDays: String {
    case Monday     =    "Mon."
    case Tuesday    =    "Tue."
    case Wednesday  =    "Wed."
    case Thursday   =    "Thu."
    case Friday     =    "Fri."
    
    var message: String {
        return "Today is " + self.rawValue
    }
}

var day = WeekDays.Monday
print(day.message)
