

import Foundation

let filePath = "xxx"

var err: NSError?

let contents = NSString(contentsOfFile: filePath, encoding: String.Encoding.utf8, error: &err)

if err != nil {
    // 错误处理
}
