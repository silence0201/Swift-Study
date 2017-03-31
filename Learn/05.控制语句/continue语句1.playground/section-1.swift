


let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

for elem in 0 ..< numbers.count {
    if elem == 3 {
        continue
    }
    print("Element is: \(elem)")
}

