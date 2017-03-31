

func isEqualsInt(a: Int, b: Int) -> Bool {
    return (a == b)
}

func isEqualsDouble(a: Double, b: Double) -> Bool {
    return (a == b)
}

func isEqualsString(a: String, b: String) -> Bool {
    return (a == b)
}

func isEquals<T:Comparable>(a: T, b: T) -> Bool {
    return (a == b)
}

let n1 = 200
let n2 = 100

print(isEquals(a: n1, b: n2))

let s1 = "ABC1"
let s2 = "ABC1"

print(isEquals(a: s1, b: s2))
