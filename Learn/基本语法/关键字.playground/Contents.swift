
import Foundation

func log(message: String) {
    print("FUNCTION:\(#function) COLUMN:\(#column), FILE:\(#file) LINE:\(#line) \(message)")
}
log(message: "Test")
