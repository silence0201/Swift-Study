//
//  ViewController.swift
//  KeyBoardDemo
//
//  Created by 杨晴贺 on 2017/3/17.
//  Copyright © 2017年 Silence. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let keyboardView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 253))
        keyboardView.backgroundColor = UIColor.red
        textView.inputView = keyboardView
        
        // 设置输入助理视图
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 200, height: 44))
        textView.inputAccessoryView = toolbar
        
        // 刷新输入视图
        textView.reloadInputViews()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textView.resignFirstResponder()
    }


}

