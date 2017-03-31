

import Foundation

class Rectangle {
    
    var width: Double
    var height: Double
    
    init(width: Double, height: Double) {
        self.width   = width
        self.height  = height
    }
    
    init(W width: Double, H height: Double) {
        self.width   = width
        self.height  = height
    }
    
    deinit {
        print("调用析构器...")
        self.width = 0.0
        self.height  = 0.0
        
    }
}

var rectc1: Rectangle? = Rectangle(width: 320, height: 480)
print("长方形:\(rectc1!.width) x \(rectc1!.height)")
rectc1 = nil

var rectc2: Rectangle? = Rectangle(W: 320, H: 480)
print("长方形:\(rectc2!.width) x \(rectc2!.height)")
rectc2 = nil
