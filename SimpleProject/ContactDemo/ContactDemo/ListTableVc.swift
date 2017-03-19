//
//  ListTableVc.swift
//  ContactDemo
//
//  Created by 杨晴贺 on 2017/3/5.
//  Copyright © 2017年 Silence. All rights reserved.
//

import UIKit

class ListTableVc: UITableViewController {

    var personList = [Person]()

    @IBAction func newPerson(_ sender: Any) {
        performSegue(withIdentifier: "List2Detail", sender: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData { (list) in
            print(list)
            // 在闭包中定义好的代码需要时执行,需要self制定语句
            self.personList += list
            self.tableView.reloadData()
        }
    }
    
    // 模拟异步
    private func loadData(completion:@escaping (_ list:[Person]) -> Void) -> Void{
        DispatchQueue.global().async {
            var arrayM = [Person]()
            print("正在努力加载")
            Thread.sleep(forTimeInterval: 1)
            for i in 0..<20{
                let p = Person()
                p.name = "zhang-\(i)"
                p.phone = "1860" + String(format: "%06d", arc4random_uniform(1000000))
                p.title = "Boss-\(i)"
                arrayM.append(p)
            }
            
            // 主线程回调
            DispatchQueue.main.async {
                // 执行闭包
                completion(arrayM)
            }
        }

    }
    
    //MARK: 数据源方法
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = personList[indexPath.row].name
        cell.detailTextLabel?.text = personList[indexPath.row].phone
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: "List2Detail", sender: indexPath)
    }
    
    
    // 控制器跳转
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! DetailTableVc
        
        // 设置选中的person
        if let indexPath = sender as? IndexPath{
            vc.person = personList[indexPath.row]
            vc.completionCallBack = {
                self.tableView.reloadRows(at: [indexPath], with: .fade)
            }
        }else{
            vc.completionCallBack = {
                guard let p = vc.person else {
                    return
                }
                
                self.personList.insert(p, at: 0)
                self.tableView.reloadData()
            }
        }
    }


}
