

class Rectangle {
    
    var width: Double
    var height: Double
    
    init(width: Double, height: Double) {
        self.width   = width
        self.height  = height
    }
    
    init(W width: Double,H height: Double) {
        self.width   = width
        self.height  = height
    }
    
    convenience init(length: Double) {
        self.init(W: length, H: length)
    }
    
    convenience init() {
        self.init(width: 640.0, height: 940.0)
    }
    
}

var rectc1 = Rectangle(width: 320.0, height: 480.0)
print("长方形1:\(rectc1.width) x \(rectc1.height)")

var rectc2 = Rectangle(W: 320.0, H: 480.0)
print("长方形2:\(rectc2.width) x \(rectc2.height)")

var rectc3 = Rectangle(length: 500.0)
print("长方形3:\(rectc3.width) x \(rectc3.height)")

var rectc4 = Rectangle()
print("长方形4:\(rectc4.width) x \(rectc4.height)")

