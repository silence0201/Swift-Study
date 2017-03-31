
//定义轮船协议
protocol Ship {
    //排水量
    var displacement: Double { get set }
}

//定义武器协议
protocol Weapon {
    //火炮门数
    var gunNumber: Int { get set }
}

//定义军舰类
class Warship: Ship, Weapon {
    //排水量
    var displacement  = 1000_000.00
    //火炮门数
    var gunNumber = 10
}

func showWarResource(resource: Ship & Weapon) {
    print("Ship \(resource.displacement) - Weapon \(resource.gunNumber)")
}

let ship = Warship()
showWarResource(resource: ship)
