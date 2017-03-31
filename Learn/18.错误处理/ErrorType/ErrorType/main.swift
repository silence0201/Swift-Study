

import Foundation

//自定义错误类型
enum DAOError: Error {
    case noData
    case primaryKeyNull
}


do {
    //try 访问数据表函数或方法
} catch DAOError.noData {
    print("没有数据。")
} catch DAOError.primaryKeyNull {
    print("主键为空。")
}
