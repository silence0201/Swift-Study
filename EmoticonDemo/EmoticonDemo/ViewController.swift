//
//  ViewController.swift
//  EmoticonDemo
//
//  Created by 杨晴贺 on 2017/3/16.
//  Copyright © 2017年 Silence. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let string = "我[爱你]啊[笑哈哈]!"
        label.attributedText = EmoticonManager.shared.emoticonString(string: string, font: label.font)
    }

}

