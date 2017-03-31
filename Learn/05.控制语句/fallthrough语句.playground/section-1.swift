


var j = 1
var x = 4

switch x {
case 1:
    j += 1
case 2:
    j += 1
case 3:
    j += 1
case 4:
    j += 1
    fallthrough
case 5:
    j += 1
    fallthrough
default:
    j += 1
}

print("j = \(j)")


