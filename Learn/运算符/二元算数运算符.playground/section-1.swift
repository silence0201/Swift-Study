
//声明一个整型变量
var intResult = 1 + 2
print(intResult)

intResult = intResult - 1
print(intResult)

intResult = intResult * 2
print(intResult)

intResult = intResult / 2
print(intResult)

intResult = intResult + 8
intResult = intResult % 7
print(intResult)

print("-------")
//声明一个浮点型变量
var doubleResult = 10.0
print(doubleResult)

doubleResult = doubleResult - 1
print(doubleResult)

doubleResult = doubleResult * 2
print(doubleResult)

doubleResult = doubleResult / 2
print(doubleResult)

doubleResult = doubleResult + 8
doubleResult = doubleResult.truncatingRemainder(dividingBy: 7) //替代Swift2语句doubleResult % 7

print(doubleResult)
