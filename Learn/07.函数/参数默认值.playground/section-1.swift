
func makecoffee(type: String = "卡布奇诺") -> String {
    return "制作一杯\(type)咖啡。"
}

let coffee1 = makecoffee(type: "拿铁")
let coffee2 = makecoffee()

print("\(coffee1)")
print("\(coffee2)")
