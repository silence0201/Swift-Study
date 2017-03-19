//
//  ViewController.swift
//  RefreshControlDemo
//
//  Created by 杨晴贺 on 2017/3/15.
//  Copyright © 2017年 Silence. All rights reserved.
//

import UIKit

/// 系统刷新空间的问题
/// 1. 如果用户不放手,下拉到一定程度就会自动进入刷新状态,浪费流量
/// 2. 如果程序主动调用,beginRefreshing,不显示菊花
class ViewController: UITableViewController {

    lazy var refresh: SIRefershContoller = SIRefershContoller()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.addSubview(refresh)
        refresh.addTarget(self, action: #selector(loadData), for: .valueChanged)
        automaticallyAdjustsScrollViewInsets = false ;
        tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0)
        
        loadData()
    }
    
    @objc func loadData(){
        print("开始刷新")
        refresh.beginRefreshing()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) { 
            print("刷新结束")
            self.refresh.endRefreshing()
        }
    }
}

