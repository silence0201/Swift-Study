//: Playground - noun: a place where people can play


// String
let someString = "Some string "

// 初始化
var emptyString = ""
var anotherEmptyString = String()
if emptyString.isEmpty {
    print("Nothing to see here")
}

// String相加
var variableString = "Horse"
variableString += " and carriage"

let constantString = "Highlander"

// 遍历
for chara in "Dog!🐩".characters{
    print(chara)
}

let exclamationMakr: Character = "!"

let catCharacters: [Character] = ["C","a","t"]
print(catCharacters)
let catString = String(catCharacters)
print(catString)

let string1 = "Hello"
let string2 = " there"
var welcome = string1 + string2

var instruction = "look over"
instruction += string2

welcome.append(exclamationMakr)

let multplier = 3
let message = "\(multplier) timer 2.5 is \(Double(multplier)*2.5)"

let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
print(wiseWords)

let dollarSign = "\u{24}"
print(dollarSign)

let blackHeart = "\u{2665}"
print(blackHeart)

let sparklingHeart = "\u{1F496}"
print(sparklingHeart)

let eAcute: Character = "\u{E9}"
print(eAcute)

let combinedAcute: Character = "\u{65}\u{301}"
print(combinedAcute)

let precomposed: Character = "\u{D55C}"                 // 한
print(precomposed)

let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"  // ᄒ, ᅡ, ᆫ
print(decomposed)

let enclosedEAcute: Character = "\u{E9}\u{20DD}"
print(enclosedEAcute)

let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
print(regionalIndicatorForUS)

let regionalIndicatorForAUS: Character = "\u{1F1E6}\u{1F1FA}"
print(regionalIndicatorForAUS)

let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("count:\(unusualMenagerie.characters.count) characters")

var word = "cafe"
print("number:\(word) : \(word.characters.count)")

word += "\u{301}"
print("number \(word) is \(word.characters.count)")

let greening = "Guten Tag!"
greening[greening.startIndex]
greening[greening.index(before: greening.endIndex)]
greening[greening.index(after: greening.startIndex)]

let index = greening.index(greening.startIndex, offsetBy: 7)

greening[index]

for index in greening.characters.indices{
    print("\(greening[index])")
}

// 
var welcome2 = "hello"
welcome2.insert("!", at: welcome2.endIndex)
welcome2.insert(contentsOf: " therr".characters, at: welcome2.index(before: welcome2.endIndex))

welcome2.remove(at: welcome2.index(welcome2.endIndex, offsetBy: -6))
print(welcome2)

let range = welcome2.index(welcome2.endIndex, offsetBy: -6)..<welcome2.endIndex
welcome2.removeSubrange(range)

let quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
    print("相同")
}

let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"

let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"
let combinedEAcuteQuestion2 = "Voulez-vous un cafe\u{301}?"

if eAcuteQuestion == combinedEAcuteQuestion {
    print("considered equal")
}

let latinCapitalLeterA: Character = "\u{41}"
let cyrillicCapitalLetterA: Character = "\u{0410}"
if latinCapitalLeterA != cyrillicCapitalLetterA {
    print("These two characters are not equivalent")
}

// 前缀
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SenenCount = 0
for senen in romeoAndJuliet{
    if senen.hasPrefix("Act 1") {
        act1SenenCount += 1
    }
}
print("There are \(act1SenenCount) senes in Act 1")

var mansionCount = 0
var cellCount = 0
for scen in romeoAndJuliet{
    if scen.hasSuffix("Capulet's mansion"){
        mansionCount += 1
    }else if scen.hasSuffix("Friar Lawrence's cell"){
        cellCount += 1
    }
}
print("\(mansionCount) masion scenes; \(cellCount) cell secnes")

let dogString = "Dog!!🐶"

// UTF-8
for codeUnit in dogString.utf8{
    print("\(codeUnit)")
}
print("---------------")

for scalar in dogString.unicodeScalars{
    print("\(scalar.value)")
}
print("--------------")
for scalar in dogString.unicodeScalars{
    print("\(scalar)")
}


		