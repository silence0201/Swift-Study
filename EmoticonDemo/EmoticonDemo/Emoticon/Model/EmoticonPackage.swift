//
//  EmoticonPackage.swift
//  EmoticonDemo
//
//  Created by 杨晴贺 on 2017/3/16.
//  Copyright © 2017年 Silence. All rights reserved.
//

import UIKit
import YYModel

/// 表情包模型
class EmoticonPackage: NSObject {
    // MARK: - 属性
    // MARK: -
    /// 表情包的分组名
    var groupName: String?
    /// 背景图片名称
    var bgImageName: String?
    
    /// 表情包目录，从目录下加载 info.plist 可以创建表情模型数组
    var directory: String? {
        didSet {
            // 当设置目录时，从目录下加载 info.plist
            guard let directory = directory,
                let path = Bundle.main.path(forResource: "Emoticon.bundle", ofType: nil),
                let bundle = Bundle(path: path),
                let infoPath = bundle.path(forResource: "info.plist", ofType: nil, inDirectory: directory),
                let array = NSArray(contentsOfFile: infoPath) as? [[String: String]],
                let models = NSArray.yy_modelArray(with: Emoticon.self, json: array) as? [Emoticon]
                
                else {
                    return
            }
            
            // 遍历 models 数组，设置每一个表情符号的目录
            for m in models {
                m.directory = directory
            }
            
            // 设置表情模型数组
            emoticons += models
        }
    }
    
    /// 懒加载的表情模型的空数组
    /// 使用懒加载可以避免后续的解包
    lazy var emoticons = [Emoticon]()
    
    override var description: String {
        return yy_modelDescription()
    }
}

