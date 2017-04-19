//: Playground - noun: a place where people can play

import UIKit

class Person{
    
    var name: String
    var pet: Pet?
    
    init(name: String){
        self.name = name
        print(name,"is coming")
    }
    
    init(name: String, petName: String){
        self.name = name
        self.pet = Pet(name: petName);
        print("Person", name, "is initialized")
    }
    
    func doSomething(){
        print(name,"is doing something")
    }
    
    deinit{ //类析构函数 由于Swift中已经帮助我们自动处理, 所以这里deinit中不需要释放任何空间了
        //print(name,"is leaving!")
        print("Person", name, "is deinitialized!")
    }
}

class Pet{
    var name: String
    init(name: String){
        self.name = name;
        print("Pet", name, "is initialized");
    }
    
    deinit{
        print("Pet", name, "is deinitialized!")
    }
}

var kangqiao: Person? = Person(name: "kangqiao1")
kangqiao = nil //当设置变量为nil时, 就是说明不需要这个变量. 此时会执行deinit析构函数.

func inTheShop(){
    
    print("==========")
    print("Welcome!")
    
    // let 在作用域的最后也会deinit
    let kangqiao: Person = Person(name: "kangqiao2")
    kangqiao.doSomething()
}

inTheShop() //在函数结束后, 会释放函数作用域的变量kangqiao. 

func inTheAppleStore(){
    
    print("==========")
    print("Welcome to the Apple Store!")
    
    for i in 1...3{
        print("Time",i)
        //对于循环中person变量它的作用域仅在循环中, 当循环每执行一次, person都将执行deinit析构函数 释放其占用的存储空间.
        let kangqiao: Person = Person(name: "kangqiao_Time"+String(i))
        kangqiao.doSomething()
    }
}

inTheAppleStore()


// deinit主要用于回收资源

print("++++================++++")
//var kangqiao2: Person? = Person(name: "kangqiao", petName: "aZai");
//kangqiao2 = nil

var kangqiao3: Person? = Person(name: "kangqiao3")

var aZai: Pet? = Pet(name: "aZai")
kangqiao3?.pet = aZai
//kangqiao3?.pet = Pet(name: "aZai222")

kangqiao3 = nil
print("aZai 作用于 aZai这个变量. 并不会因kangqiao3的释放而释放. 因为仍有引用引用它")
aZai = nil


/*** Strong-Reference_Cycles 强引用循环 ***/
print("++++==== Strong-Reference_Cycles ====++++")
print("======= weak 打破强引用循环 ====================================")
class Person2{
    
    var name: String
    var apartment: Apartment? //人可以有公寓, 也可以没有.
    
    init(name: String){
        self.name = name
        print("Person2", name, "is initialized")
    }
    
    deinit{
        print("Person2", name, "is being deinitialized!")
    }
}

class Apartment{ //公寓
    
    let name: String
    // weak must be optional
    // weak must be var, not let!
    // Then, weak can be change to nil
    // can be !
    weak var tenant: Person2? //weak指示的变量并不会增加引用变量的引用计数.
    
    init(name: String){
        self.name = name
        print("Apartment", name, "is initialized!")
    }
    
    deinit{
        print("Apartment", name, "is being deinitialized!")
    }
}

var kangqiao4: Person2? = Person2(name: "kangqiao4")
var imoocApartment: Apartment? = Apartment(name: "imooc Apartment")
kangqiao4?.apartment = imoocApartment
imoocApartment?.tenant = kangqiao4

//imoocApartment?.tenant = nil
//kangqiao4?.apartment = nil

kangqiao4 = nil
imoocApartment = nil

// 内存没有被正确释放
/*** 内存泄漏了 ***/
//当出现循环引用时, 应使用weak来解除. 


// unowned 解决强引用循环,   unowned 也表示一个弱引用类型.
print("======= unowned 打破强引用循环 ====================================")
class Person3{
    
    var name: String
    var creditCard: CreditCard? //人可以有也可以没有信用卡.
    
    init(name: String){
        self.name = name
        print("Person3", name, "is initialized")
    }
    
    deinit{
        print("Person3", name, "is being deinitialized!")
    }
}

class CreditCard{
    
    let number: String
    //unowned指示的变量永远不能为空, 或者说指示的变量不能被提前释放掉.
    unowned let customer: Person3 //信用卡必须属于一个人.
    
    init(number: String, customer: Person3){
        self.number = number
        self.customer = customer
        print("Credit Card", number, "is initialized")
    }
    
    deinit{
        print("Credit Card", number, "is being deinitialized!")
    }
}

var kangqiao5: Person3? = Person3(name: "kangqiao5")
var goldenCard: CreditCard? = CreditCard(number: "12345678", customer: kangqiao5!)
kangqiao5?.creditCard = goldenCard!

kangqiao5 = nil

// unowned is unsafe!

//goldenCard!.customer
//goldenCard

goldenCard = nil

print("====== 隐式可选型 结合 unowned 解决强引用循环 =========")
class Country{ //国家
    
    let name: String
    //let capital2: City!
    var capital: City! //隐式可选型
    
    init(countryName: String, capitalName: String){
        self.name = countryName
        //初始化第二段开始
        self.capital = City(cityName: capitalName, country: self)
        print("Country", name, "is intialized.")
    }
    
    deinit{
        print("Country",name,"is being deinitialized!")
    }
}

class City{ //城市
    
    let name: String
    unowned let country: Country
    
    init(cityName: String, country: Country){
        self.name = cityName
        self.country = country
        print("City", name, "is intialized.")
    }
    
    deinit{
        print("City",name,"is being deinitialized!")
    }
}

var china: Country? = Country(countryName: "China", capitalName: "Beijing")
//china?.capital
china = nil

print("=========== Closure 闭包中强引用循环问题 , 闭包也属于一种引用类型 ==================")
class SmartAirConditioner{
    
    var temperature: Int = 26
    var temperatureChange: ((Int) -> ())!
    
    init(){
        temperatureChange = { newTemperature in
            if abs(newTemperature - self.temperature) >= 10{
                print("It's not healthy to do it!")
            }
            else{
                self.temperature = newTemperature
                print("New temperature \(self.temperature) is set!")
            }
        }
    }
    
    deinit{
        print("Smart Air-conditioner is being deinitialized!")
    }
}

var airCon: SmartAirConditioner? = SmartAirConditioner()
airCon?.temperature
airCon?.temperatureChange(100)

airCon?.temperatureChange(24)

//此时并不会执行deinit, 释放airCon的存储空间.
//这是因为airCon的temperatureChange闭包函数中强引用了airCon(self.temperature), 导致不能被airCon不能被释放.
//airCon = nil

//当改变了temperatureChange闭包函数后, 并不会再强引用了airCon.
airCon?.temperatureChange = { newTemperature in
    
    if newTemperature >= 10 && newTemperature <= 26{
        airCon?.temperature = newTemperature
        print("New temperature \(newTemperature) is set!")
    }
    else{
        print("\(newTemperature) is not a good temperature!")
    }
}

airCon?.temperatureChange(12)

airCon = nil

//Swift中不能用 unowned 或weak 指定闭包 弱引用类型
print("=========== 在闭包的 <捕获列表中> 使用弱引用 打破 闭包中强引用循环问题 ==================")
class SmartAirConditioner2{
    
    private var temperature: Int = 26
    var temperatureChange: ((Int) -> ())!
    
    // 使用强制解包 weak self
    //    init(){
    //        temperatureChange = { [weak self](newTemperature) in
    //            if abs(newTemperature - self!.temperature) >= 10{
    //                print("It's not healthy to do it!")
    //            }
    //            else{
    //                self!.temperature = newTemperature
    //                print("New temperature \(newTemperature) is set!")
    //            }
    //        }
    //    }
    
    // 使用 if let `self` 解包 weak self 
    // 用反向单引号指示解包后的self继续承载在self中使用.
//        init(){
//            temperatureChange = { [weak self](newTemperature) in
//                if let `self` = self{
//                    if abs(newTemperature - self.temperature) >= 10{
//                        print("It's not healthy to do it!")
//                    }
//                    else{
//                        self.temperature = newTemperature
//                        print("New temperature \(newTemperature) is set!")
//                    }
//                }
//            }
//        }
    
    // 使用 if let weakSelf(起一个新名字) 解包 weak self
    //    init(){
    //        temperatureChange = { [weak self](newTemperature) in
    //            if let weakSelf = self{
    //                if abs(newTemperature - weakSelf.temperature) >= 10{
    //                    print("It's not healthy to do it!")
    //                }
    //                else{
    //                    weakSelf.temperature = newTemperature
    //                    print("New temperature \(newTemperature) is set!")
    //                }
    //            }
    //        }
    //    }
    
    // 使用 unowned self
    init(){
        temperatureChange = { [unowned self]newTemperature in
            if abs(newTemperature - self.temperature) >= 10{
                print("It's not healthy to do it!")
            }
            else{
                self.temperature = newTemperature
                print("New temperature \(newTemperature) is set!")
            }
        }
    }
    
    deinit{
        print("Smart Air-conditioner is being deinitialized!")
    }
}

var airCon2: SmartAirConditioner2? = SmartAirConditioner2()
//airCon2?.temperature //'temperature' is inaccessible due to 'private' protection level
airCon2?.temperatureChange(100)
airCon2?.temperatureChange(24)
airCon2 = nil



















