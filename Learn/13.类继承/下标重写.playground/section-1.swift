

class DoubleDimensionalArray {
    
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
        
        set {
            grid[(row * columns) + col] = newValue
        }
    }
    
}

class SquareMatrix : DoubleDimensionalArray {
    
    override subscript(row: Int, col: Int) -> Int {
        
        get {
            return super.grid[(row * columns) + col]
        }
        
        set {
            super.grid[(row * columns) + col] = newValue * newValue
        }
    }
}

var ary2 = SquareMatrix(rows: 5, columns: 5)

for i in 0 ..< 5 {
    for j in 0 ..< 5 {
        ary2[i,j] = i + j
    }
}

for i in 0 ..< 5 {
    for j in 0 ..< 5 {
        print("\t \(ary2[i,j])", terminator: "")
    }
    print("\n")
}
