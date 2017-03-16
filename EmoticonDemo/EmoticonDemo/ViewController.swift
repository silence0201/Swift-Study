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
        
        let attache = NSTextAttachment()
        
        attache.image = UIImage (named: "d_aini")
        let height = label.font.lineHeight
        attache.bounds = CGRect(x: 0, y: -4, width: height, height: height)
        
        let attr = NSAttributedString(attachment: attache)
        
        let arrtM = NSMutableAttributedString(string: "我")
        arrtM.append(attr)
        label.attributedText = arrtM
    }

}

