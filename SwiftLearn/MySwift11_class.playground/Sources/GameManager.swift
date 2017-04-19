import Foundation

//
public class GameManager{
    public var score = 0
    public static let defaultGameManager = GameManager()
    
    //设置private后, 就只有GameManager自己也就是在本文件中能初始化它了.
    private init(){
    }
    
    public func addScore(){
        score += 10
    }
}