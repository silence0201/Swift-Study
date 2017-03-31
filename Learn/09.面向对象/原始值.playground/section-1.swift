
enum WeekDays: Int {
    case Monday         = 0
    case Tuesday        = 1
    case Wednesday      = 2
    case Thursday       = 3
    case Friday         = 4
}

//enum WeekDays: Int {
//    case Monday = 0, Tuesday, Wednesday, Thursday, Friday
//}

var day  = WeekDays.Friday
day = WeekDays.Wednesday


func writeGreeting(day: WeekDays) {
    
    switch day {
    case .Monday:
        print("星期一好！")
    case .Tuesday :
        print("星期二好！")
    case .Wednesday :
        print("星期三好！")
    case .Thursday :
        print("星期四好！")
    case .Friday :
        print("星期五好！")
    }
    
}

let friday = WeekDays.Friday.rawValue

let thursday = WeekDays(rawValue: 3)

if (WeekDays.Friday.rawValue == 4) {
    print("今天是星期五")
}

writeGreeting(day: day)
writeGreeting(day: WeekDays.Friday)
