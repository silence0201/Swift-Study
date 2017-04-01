//: Playground - noun: a place where people can play

import Foundation

func incrementor1(variable: Int) -> Int {
    return variable + 1
}

let a = incrementor1(variable: 4)

func incrementor2(variable: Int) -> Int {
    var num = variable
    num += 1
    return num
}

var luvkyNumber = 7
let newnumber = incrementor2(variable: luvkyNumber)

print(luvkyNumber)

func incrementor3(variable: inout Int) {
    variable += 1
}

luvkyNumber = 7
incrementor3(variable: &luvkyNumber)

print(luvkyNumber)

func makeIncrementor(addNumber: Int) -> ((inout Int) -> ()) {
    func incrementor(variable: inout Int) -> () {
        variable += addNumber
    }
    return incrementor
}

var input = 10
let incrementor = makeIncrementor(addNumber: 2)
incrementor(&input)
print(input)
		