//: Playground - noun: a place where people can play

class Vehicle{
    var currentSpeed = 0.0
    var description: String{
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise(){
        print(#function)
    }
}

let someVehicle = Vehicle()
print("Vegucle:\(someVehicle.description)")

class Bicycle: Vehicle{
    var hasBasket = true
}

let bicycle = Bicycle()
bicycle.hasBasket = false

bicycle.currentSpeed = 15.0
print("Bicycle:\(bicycle.description)")

class Tandem: Bicycle{
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentSpeed = 22.0
tandem.currentNumberOfPassengers = 2
print("Tadnem:\(tandem.description)")

// 重写方法
class Train: Vehicle{
    override func makeNoise() {
        print("Choo Choo")
    }
}
let train = Train()
train.makeNoise()


// 重写属性
class Car: Vehicle{
    var gear = 1
    override var description: String{
        return super.description + "in gear \(gear)"
    }
}
let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car:\(car.description)")

// 重写属性监听
class AutoationCar: Car{
    override var currentSpeed: Double{
        didSet{
            gear = Int(currentSpeed / 10.0)+1
        }
    }
}

let automatic = AutoationCar()
automatic.currentSpeed = 35.0
print("AutomaticCar:\(automatic.description)")
