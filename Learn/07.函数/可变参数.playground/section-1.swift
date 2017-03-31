
func sum(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total
}

sum(numbers: 100.0, 20, 30)

sum(numbers: 30, 80)
