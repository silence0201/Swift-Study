//: Playground - noun: a place where people can play

/* 函数式代码只描述了一件事情：没有副作用。 */

/// 非函数式的 ///

var a = 0

func incrementUnfunctional() -> Void {
    a += 1
}

incrementUnfunctional()
print(a)

/// 函数式的 ///
a = 0

func incrementFunctional(num: Int) -> Int {
    return num + 1
}

a = incrementFunctional(num: a)
print(a)