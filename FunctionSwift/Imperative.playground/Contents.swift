//: Playground - noun: a place where people can play

import Foundation
/*** 声明式编程，不是命令式 ***/

// Imperative vs. Declarative - 实例 #1

/// Imperative - 第一次尝试 ///

var time = 4
var carPositions = [1,1,1]

// 辅助方法

func randomElement(_ array: [String]) -> String {
    let randomIndex = randomPositiveNumberUpTo(array.count)
    return array[randomIndex]
}

func randomPositiveNumberUpTo(_ upperBound: Int) -> Int {
    return Int(arc4random_uniform(UInt32(upperBound)))
}

while time>0 {
    time -= 1
    print("\n")
    
    for index in 0..<carPositions.count {
        if(randomPositiveNumberUpTo(10) > 3) {
            carPositions[index] += 1
        }
        
        for _ in 0..<carPositions[index] {
            print("-", separator: "", terminator: "")
        }
        
        print("\n")
    }
}

/*** 声明式的编码，而不是命令式的 ***/

// Imperative vs. Declarative - 例子 #2

/// Imperative - 第二次尝试 ///

time = 5
carPositions = [1, 1, 1]



// Helpers

func runStepOfRace() -> () {
    time -= 1
    moveCars()
}

func draw() {
    print("\n")
    
    for carPosition in carPositions {
        drawCar(carPosition)
    }
}

func moveCars() -> () {
    for index in 0..<carPositions.count {
        if(randomPositiveNumberUpTo(10) > 3) {
            carPositions[index] += 1
        }
    }
}

func drawCar(_ carPosition: Int) -> () {
    for _ in 0..<carPosition {
        print("-")
    }
    
    print("\n")
}

while(time > 0) {
    runStepOfRace()
    draw()
}
