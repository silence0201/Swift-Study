
struct DoubleDimensionalArray {
    
    let rows: Int, columns: Int
    var grid: [Int]
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0, count: rows * columns)
    }
    
    subscript(row: Int, col: Int) -> Int {
        
        get {
            return grid[(row * columns) + col]
        }
        
        set(newValue1) {
            grid[(row * columns) + col] = newValue1
        }
    }
    
}

let COL_NUM = 10
let ROW_NUM = 10

var ary2 = DoubleDimensionalArray(rows: ROW_NUM, columns: COL_NUM)

for i in 0 ..< ROW_NUM {
    for j in 0 ..< COL_NUM {
        ary2[i, j] = i * j
    }
}

// 打印输出二维数组
for i in 0 ..< ROW_NUM {
    for j in 0 ..< COL_NUM {
        print("\t \(ary2[i, j])", terminator: "")
    }
    print("\n")
}
