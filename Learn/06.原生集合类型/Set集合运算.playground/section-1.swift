

import Foundation

let A: Set<String>  = ["a","b","e","d"]
let B: Set<String>  = ["d","c","e","f"]

print("A与B交集 = \(A.intersection(B))")
print("A与B并集 = \(A.union(B))")
print("A与B异或集合 = \(A.symmetricDifference(B))")

let C = A.subtracting(B)
print("A与B差集 = \(C)")

if C.isSubset(of: A) {
    print("C是A的子集")
}
