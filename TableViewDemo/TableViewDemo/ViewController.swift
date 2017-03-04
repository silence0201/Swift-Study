//
//  ViewController.swift
//  TableViewDemo
//
//  Created by 杨晴贺 on 2017/3/4.
//  Copyright © 2017年 Silence. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI(){
        // 创建表格
        let tv = UITableView(frame: view.bounds, style: .plain)
        
        // 添加
        view.addSubview(tv)
        
        // 注册可重用cell
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // 设置数据源
        tv.dataSource = self
    }
    
    // MARK: UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for:indexPath)
        // ? 如果有就使用,如果没有就什么也不做
        cell.textLabel?.text = "{\(indexPath.section),\(indexPath.row)}"
        return cell
    }


}

