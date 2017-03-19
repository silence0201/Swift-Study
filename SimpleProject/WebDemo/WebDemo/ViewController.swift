//
//  ViewController.swift
//  WebDemo
//
//  Created by 杨晴贺 on 2017/3/5.
//  Copyright © 2017年 Silence. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.baidu.com")
        
        URLSession.shared.dataTask(with: url!) { (data, _, _) in
            guard let data = data else{
                print("网络请求失败")
                return
            }
            // 将data转换为String
            let html = String(data: data, encoding: .utf8)
            
            print(html ?? "")
        }.resume()
    }


}

