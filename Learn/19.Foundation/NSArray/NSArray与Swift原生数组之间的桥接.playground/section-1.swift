

import Foundation

let foundationString: NSString = "alpha bravo charlie delta echo"
//返回[String]
let swiftArray1 = foundationString.components(separatedBy: " ")

//原生数组[String]转换为NSArray
let foundationArray = swiftArray1 as NSArray

//NSArray转换为原生数组[AnyObject]
let swiftArray2 = foundationArray as [AnyObject]

for item in swiftArray1  {
    print(item)
}

for item in foundationArray  {
    print(item)
}

for item in swiftArray2  {
    print(item)
}
