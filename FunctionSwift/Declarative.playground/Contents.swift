//: Playground - noun: a place where people can play

/*** 声明式编程，不是命令式 ***/

// Imperative vs. Declarative - 例子 #3
import Foundation
/// 声明式的 ///

typealias Time = Int
typealias Positions = [Int]
typealias State = (time: Time, positions: Positions)

let state: State = (time: 5, positions: [1, 1, 1])



// 辅助函数

// 辅助方法

func randomElement(_ array: [String]) -> String {
    let randomIndex = randomPositiveNumberUpTo(array.count)
    return array[randomIndex]
}

func randomPositiveNumberUpTo(_ upperBound: Int) -> Int {
    return Int(arc4random_uniform(UInt32(upperBound)))
}

func draw(state: State) -> () {
    let outputs = state.positions.map { position in outputCar(carPosition: position) }
    
    print(outputs)
}

func runStepOfRace(state: State) -> State {
    let newTime = state.time - 1
    let newPositions = moveCars(positions: state.positions)
    
    return (newTime, newPositions)
}

func outputCar(carPosition: Int) -> String {
    let output = (0..<carPosition).map { _ in "-" }
    
    return output.joined()
}

func moveCars(positions: [Int]) -> [Int] {
    return positions.map { position in (randomPositiveNumberUpTo(10) >
        3) ? position + 1 : position }
}

func race(state: State) -> () {
    draw(state: state)
    
    if(state.time > 1) {
        print("\n\n")
        race(state: runStepOfRace(state: state))
    }
}



race(state: state)
