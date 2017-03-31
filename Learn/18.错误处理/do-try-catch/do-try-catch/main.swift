

import Foundation

let filePath = "xxx"
 
do {
    let str = try NSString(contentsOfFile: filePath, encoding: String.Encoding.utf8.rawValue)
//    let str = try String(contentsOfFile: filePath, encoding: String.Encoding.utf8)
} catch let err as NSError {
    print(err.description)
}
