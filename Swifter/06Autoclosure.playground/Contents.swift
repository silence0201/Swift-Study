//: Playground - noun: a place where people can play

import UIKit

func logIfTrue(_ predicate: () -> Bool) {
    if predicate() {
        print("True")
    }
}

logIfTrue { () -> Bool in
    return 2 > 1
}

logIfTrue({2 > 1})
logIfTrue{2>1}

func logIfTrue(_ predicate: @autoclosure () -> Bool) {
    if predicate() {
        print("True")
    }
}

logIfTrue(2 > 1)

