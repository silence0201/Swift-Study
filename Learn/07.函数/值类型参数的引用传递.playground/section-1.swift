
func increment(value: inout Double, amount: Double = 1.0) {
    value += amount
}

var value: Double = 10.0

increment(value: &value)
print(value)

increment(value: &value, amount: 100.0)
print(value)
