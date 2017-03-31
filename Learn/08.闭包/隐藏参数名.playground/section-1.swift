
func calculate(opr: String) -> (Int, Int) -> Int {
    
    var result: (Int, Int) -> Int
    
    switch (opr) {
    case "+":
        result = {
            $0 + $1
        }
    default:
        result = {
            $0 - $1
        }
    }
    return result;
}

let f1: (Int, Int) -> Int = calculate(opr: "+")
print("10 + 5 = \(f1(10, 5))")

let f2: (Int, Int) -> Int = calculate(opr: "-")
print("10 - 5 = \(f2(10, 5))")
