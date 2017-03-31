

let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

let count = numbers.count
print("----半开区间----")
for i in 0..<count {
    print("第\(i + 1)个元素：\(numbers[i])")
}

print("----闭区间----")
for i in 0...5 {
    print("第\(i + 1)个元素：\(numbers[i])")
}
