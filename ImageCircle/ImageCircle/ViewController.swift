//
//  ViewController.swift
//  ImageCircle
//
//  Created by 杨晴贺 on 2017/3/14.
//  Copyright © 2017年 Silence. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let iv  = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        iv.center = view.center
        
        view.addSubview(iv)
        iv.image = image(image: UIImage(named:"立华奏5.jpg")!, size: CGSize(width: 300, height: 300))
    }
    
    // 将给定的图片进行拉伸,并且返回新的图像
    func image(image: UIImage,size: CGSize,backColor: UIColor = UIColor.white) -> UIImage {
        let rect = CGRect(origin: CGPoint(), size: size)
        // 上下文,在内存中开辟一个地址,和屏幕无关
        
        // size: 绘图的尺寸
        // opaque: 是否包含透明 false为透明
        // scale: 屏幕分辨率,默认生成1的分辨率,图片质量不好,可以指定为0,会使用当前设备的屏幕分辨率
        UIGraphicsBeginImageContextWithOptions(size, true, 0)
        // 设置填充
        backColor.setFill()
        UIRectFill(rect)
        // 实例一个原型的路径
        let path = UIBezierPath(ovalIn: rect)
        // 进行路径裁剪
        path.addClip()
        
        image.draw(in: rect)
        
        // 绘制内切的圆形
        UIColor.darkGray.setStroke()
        path.lineWidth = 2
        path.stroke()

        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return result ?? UIImage()
    }


}

