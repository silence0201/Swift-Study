


import Foundation

let docFolder = [
    "java.docx",
    "JavaBean.docx",
    "Objecitve-C.xlsx",
    "Swift.docx"
]

var wordDocCount = 0
for doc in docFolder {
    if doc.hasSuffix(".docx") {
        wordDocCount += 1
    }
}
print("文件夹中Word文档个数是： \(wordDocCount)")

var javaDocCount = 0
for doc in docFolder {
    
    let lowercaseDoc = doc.lowercased()
    
    if lowercaseDoc.hasPrefix("java") {
        javaDocCount += 1
    }
}
print("文件夹中Java相关文档个数是： \(javaDocCount)")

