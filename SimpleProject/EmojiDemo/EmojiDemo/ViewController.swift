//
//  ViewController.swift
//  EmojiDemo
//
//  Created by 杨晴贺 on 2017/3/17.
//  Copyright © 2017年 Silence. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let code = "0x1f6a3"
        
        // 实例化字符扫描
        let scanner = Scanner(string: code)
        
        // 从code中扫描出十六进制的数值
        var result: UInt32 = 0
        scanner.scanHexInt32(&result)
        
        // 生成一个UTF8的字符
        let c = Character(UnicodeScalar(result)!)
        let emoji = String(c)
        
        print(emoji)
        print(code)
    }


}

