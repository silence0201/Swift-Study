
func calculate(opr: String, funN: (Int, Int) -> Int) {
    
    switch (opr) {
    case "+":
        print("10 + 5 = \(funN(10, 5))")
    default:
        print("10 - 5 = \(funN(10, 5))")
    }
}

calculate(opr: "+", funN: { (a: Int, b: Int) -> Int in return a + b })
calculate(opr: "+") {
    (a: Int, b: Int) -> Int in return a + b
}
calculate(opr: "+") {
    $0 + $1
}

calculate(opr: "-") {
    (a: Int, b: Int) -> Int in
    return a - b
}

calculate(opr: "-") {
    $0 - $1
}
