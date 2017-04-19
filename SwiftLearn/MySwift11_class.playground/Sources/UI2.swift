import UIKit

enum Theme2{
    case DayMode
    case NightMode
}

class UI2{
    private var fontColor: UIColor!
    private var backgroundColor: UIColor!
    internal var themeMode: Theme2 = .DayMode{ //计算型属性
        didSet{
            self.changeTheme(themeMode: self.themeMode)
        }
    }
    
    init(){
        self.themeMode = .DayMode
        self.changeTheme(themeMode: self.themeMode)
    }
    
    private func changeTheme(themeMode: Theme2){
        switch(themeMode){
        case .DayMode:
            fontColor = UIColor.black
            backgroundColor = UIColor.white
        case .NightMode:
            fontColor = UIColor.white
            backgroundColor = UIColor.black
        }
    }
    
    func show(){
        print("The font color is \(fontColor == UIColor.white ? "WHITE" : "BLACK" )")
        print("The background color is \(backgroundColor == UIColor.white ? "WHITE" : "BLACK")")
    }
}

//Sources目录中只能定义, 不能执行语句.
//let ui2 = UI2()
//ui2.fontColor
//ui2.backgroundColor
//ui2.changeTheme(.NightMode) //Swift是以文件为单位的, 所以在本文件中可以访问private的方法.

