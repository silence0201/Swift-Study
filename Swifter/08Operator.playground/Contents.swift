//: Playground - noun: a place where people can play

import Foundation

struct Vector2D {
    var x = 0.0
    var y = 0.0
}


let v1 = Vector2D(x: 2.0, y: 3.0)
let v2 = Vector2D(x: 1.0, y: 4.0)
let v3 = Vector2D(x: v1.x + v2.x, y: v1.y + v2.y)

func +(l: Vector2D, r: Vector2D) -> Vector2D {
    return Vector2D(x: l.x + r.x, y: l.y + r.y)
}
let v4 = v1 + v2

precedencegroup DotProductPrecedence {
    associativity: none
    higherThan: MultiplicationPrecedence
}

infix operator +*: DotProductPrecedence

func +* (left: Vector2D, right: Vector2D) -> Double {
    return left.x * right.x + left.y * right.y
}

let result = v1 +* v2
