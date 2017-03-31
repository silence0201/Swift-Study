

print("n   n*n")
print("---------")

for i in 1 ..< 10  {
    print("\(i) x \(i) = \(i * i)")
}

let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
for item in numbers {
    print("Count is: \(item)")
}

for (index, element) in numbers.enumerated() {
    print("Item \(index): \(element)")
}
