//
//  AppDelegate.swift
//  ReflectionDemo
//
//  Created by 杨晴贺 on 2017/3/6.
//  Copyright © 2017年 Silence. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    // Swift中有命名空间,在一个命名空间下,全局共享
    // Swift中NSClassFromString写法需要带命名空间
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // 实例化
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.red
        
        // 设置更控制器,添加命名空间 -> 默认就是项目名称
        let clsName = "ReflectionDemo.ViewController"
        let cls = NSClassFromString(clsName) as? UIViewController.Type
        let vc = cls?.init()
        
        // let vc = ViewController()
        window?.rootViewController = vc
        
        window?.makeKeyAndVisible()
        
        return true
    }


}

