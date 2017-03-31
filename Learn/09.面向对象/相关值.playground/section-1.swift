

enum Figure {
    case Rectangle(Int, Int)
    case Circle(Int)
}

func printFigure(figure: Figure) {
    
    switch figure {
    case .Rectangle(let width, let height):
    //case let .Rectangle(width, height):
        print("矩形的宽:\(width) 高:\(height)")
    case .Circle(let radius):
        print("圆形的半径：\(radius)")
    }
    
}

var figure = Figure.Rectangle(1024, 768)
printFigure(figure: figure)

figure = .Circle(600)
printFigure(figure: figure)
