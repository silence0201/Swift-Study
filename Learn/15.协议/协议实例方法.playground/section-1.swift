

protocol Figure {
    func onDraw() //定义抽象绘制几何图形
}

class Rectangle: Figure {
    func onDraw() {
        print("绘制矩形...")
    }
}

class Circle: Figure {
    func onDraw() {
        print("绘制圆形...")
    }
}

let rect: Figure = Rectangle()
rect.onDraw()

let circle: Figure = Circle()
circle.onDraw()
