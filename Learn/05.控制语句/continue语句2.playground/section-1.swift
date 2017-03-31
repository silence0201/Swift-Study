

label1: for x in 0 ..< 5 {
    label2: for y in (1...5).reversed() {
        if y == x {
            continue label1
        }
        print("(x,y) = (\(x),\(y))")
    }
}

print("Game Over!")
