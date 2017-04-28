//: Playground - noun: a place where people can play

import Foundation
/* 不要在列表中使用循环，使用 map 和 reduce。 */

// Map 例子 #1

var languages = ["Objective-C", "Java", "Smalltalk"]

let languageLengths = languages.map { language in language.characters.count }

print(languageLengths)

let squares = [0,1,2,3,4].map{ $0 * $0 }
print(squares)

/* 不要在列表中使用循环，使用 map 和 reduce。 */

// Map 例子 #2

// 辅助方法

func randomElement(_ array: [String]) -> String {
    let randomIndex = randomPositiveNumberUpTo(array.count)
    return array[randomIndex]
}

func randomPositiveNumberUpTo(_ upperBound: Int) -> Int {
    return Int(arc4random_uniform(UInt32(upperBound)))
}

let newLanguages = ["Swift", "Haskell", "Erlang"]

/// 非函数式的 ///
for index in 0..<languages.count {
    languages[index] = randomElement(newLanguages)
}

/// 函数式的 ///

let randomLanguages = languages.map { _ in randomElement(newLanguages) }

print(randomLanguages) // e.g. ["Haskell", "Haskell", "Swift"]



