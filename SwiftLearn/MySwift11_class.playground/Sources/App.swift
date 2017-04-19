import Foundation

public class App{
    private let ui2 = UI2()
    public var name: String
    
    public init(name: String){
        self.name = name
    }
    
    public func switchMode(){
        switch ui2.themeMode{
        case .DayMode:
            ui2.themeMode = .NightMode
        case .NightMode:
            ui2.themeMode = .DayMode
        }
    }
    
    public func show(){
        print("The App is \(name)")
        ui2.show()
    }
}