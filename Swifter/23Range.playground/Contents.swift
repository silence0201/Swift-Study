//: Playground - noun: a place where people can play

import Foundation

for i in 0...3 {
    print(i, terminator: "")
}

let test = "helLo"
let interval = "a"..."z"
for c in test.characters {
    if !interval.contains(String(c)) {
        print("\(c) 不是小写字母")
    }
}


