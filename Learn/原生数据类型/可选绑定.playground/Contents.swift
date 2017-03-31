

import Foundation

func divide(n1: Int, n2: Int) ->Double? {
    if n2 == 0 {
        return nil
    }
    return Double(n1)/Double(n2)
}

if let result = divide(n1: 100, n2: 0) {
    print(result)
    print("Success.")
} else {
    //print(result)       //编译错误
    print("failure.")
}
