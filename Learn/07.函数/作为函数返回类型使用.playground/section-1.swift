


//定义计算长方形面积函数
func rectangleArea(width: Double, height: Double) -> Double {
    let area = width * height
    return area
}

//定义计算三角形面积函数
func triangleArea(bottom: Double, height: Double) -> Double {
    let area = 0.5 * bottom * height
    return area
}

func getArea(type: String) -> (Double, Double) -> Double {
    
    var returnFunction: (Double, Double) -> Double
    
    switch (type) {
    case "rect":   //rect 表示长方形
        returnFunction = rectangleArea
    case "tria":  //tria 表示三角形
        returnFunction = triangleArea
    default:
        returnFunction = rectangleArea
    }
    
    return returnFunction
}

//获得计算三角形面积函数
var area: (Double, Double) -> Double = getArea(type: "tria")
print("底10 高13，三角形面积：\(area(10, 15))")

//获得计算长方形面积函数
area = getArea(type: "rect")
print("宽10 高15，计算长方形面积：\(area(10, 15))")
