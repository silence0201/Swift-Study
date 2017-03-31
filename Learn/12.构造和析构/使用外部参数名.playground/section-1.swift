

//////////////// 示例1 ///////////////////////
class RectangleA {
    var width: Double
    var height: Double
    
    init(W width: Double, H height: Double) {
        self.width   = width
        self.height  = height
    }
}

var recta = RectangleA(W: 320, H: 480)
print("长方形A:\(recta.width) x \(recta.height)")

//////////////// 示例2 ///////////////////////
class RectangleB {
    var width: Double
    var height: Double
    
    init(width: Double, height: Double) {
        self.width   = width
        self.height  = height
    }
}

var rectb = RectangleB(width: 320, height: 480)
print("长方形B:\(rectb.width) x \(rectb.height)")

//////////////// 示例3 ///////////////////////
struct RectangleC {
    var width: Double = 0.0
    var height: Double = 0.0
}

var rectc = RectangleC(width: 320, height: 480)
print("长方形C:\(rectc.width) x \(rectc.height)")
