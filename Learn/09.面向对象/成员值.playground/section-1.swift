
enum WeekDays {
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
}

//enum WeekDays {
//    case Monday, Tuesday, Wednesday, Thursday, Friday
//}

var day  = WeekDays.Friday
day = WeekDays.Wednesday
day = .Monday

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
//    default:
//        print("星期五好！")
    }
}

writeGreeting(day: day)
writeGreeting(day: WeekDays.Friday)
