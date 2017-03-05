//
//  DetailTableVc.swift
//  ContactDemo
//
//  Created by 杨晴贺 on 2017/3/5.
//  Copyright © 2017年 Silence. All rights reserved.
//

import UIKit

class DetailTableVc: UITableViewController {

    var person: Person?
    // 闭包是可选的
    var completionCallBack: (() -> Void)?
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var titleText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 判断person是否有值
        if person != nil{
            nameText.text = person?.name
            phoneText.text = person?.phone
            titleText.text = person?.title
        }
    }
    
    @IBAction func savePerson(_ sender: Any) {
        // 判断Person是否为空
        if person == nil{
            person = Person()
        }
        
        person?.name = nameText.text
        person?.phone = phoneText.text
        person?.title = titleText.text
        
        // ? 可选解包
        completionCallBack?()
        
        // 返回
        _ = navigationController?.popViewController(animated: true)
    }
    
}
