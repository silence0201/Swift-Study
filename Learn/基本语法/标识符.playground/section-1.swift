
import Foundation

let π = 3.14159

let _Hello = "Hello"

let 您好 = "你好世界"

let `class` = "😄😊😃😉"

let 🌍 = "🐶🐺🐱🐭🐹🐰🐸🐯🐨🐻🐷🐽🐮🐗🐵🐒🐴🐑🐘🐼🐧🐦🐤🐥🐣🐔🐍🐢🐛🐝🐜🐞🐌🐙🐚🐠🐟🐬🐳🐋🐄🐏🐀🐃🐅🐇🐉🐎🐐🐓🐕🐖🐁🐂🐲🐡🐊🐫🐪🐆🐈🐩"

func log(message: String) {
    print("FUNCTION:\(#function) COLUMN:\(#column), FILE:\(#file) LINE:\(#line) \(message)")
}

log(message: "Test")
