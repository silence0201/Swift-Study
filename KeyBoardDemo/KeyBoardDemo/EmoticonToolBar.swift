//
//  EmoticonToolBar.swift
//  KeyBoardDemo
//
//  Created by 杨晴贺 on 2017/3/17.
//  Copyright © 2017年 Silence. All rights reserved.
//

import UIKit

protocol  EmoticonToolBarDelegae: NSObjectProtocol{
    func emoticonToolbarDidSelectedItemIndex(toolBar:EmoticonToolBar,index:Int)
}

class EmoticonToolBar: UIView {
    override func awakeFromNib() {
        setupUI()
    }
    
    override func layoutSubviews() {
        // 布局所有按钮
        let count = subviews.count
        let w = bounds.width / CGFloat(count)
        let rect = CGRect(x: 0, y: 0, width: w, height: bounds.height)
        
        for (i, btn) in subviews.enumerated() {
            btn.frame = rect.offsetBy(dx: CGFloat(i) * w, dy: 0)
        }
    }
}

extension EmoticonToolBar{
    fileprivate func setupUI(){
        // 设置按钮
        
        //从表情包的分组名称 -> 设置按钮
        // 0. 获取表情管理器单例
        let manager = EmoticonManager.shared
        
        // 从表情包的分组名称 -> 设置按钮
        for (i, p) in manager.packages.enumerated() {
            
            // 1> 实例化按钮
            let btn = UIButton()
            
            // 2> 设置按钮状态
            btn.setTitle(p.groupName, for: [])
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            
            btn.setTitleColor(UIColor.white, for: [])
            btn.setTitleColor(UIColor.darkGray, for: .highlighted)
            btn.setTitleColor(UIColor.darkGray, for: .selected)
            
            // 设置按钮的背景图片
            let imageName = "compose_emotion_table_\(p.bgImageName ?? "")_normal"
            let imageNameHL = "compose_emotion_table_\(p.bgImageName ?? "")_selected"
            
            var image = UIImage(named: imageName, in: EmoticonManager.bundle, compatibleWith: nil)
            var imageHL = UIImage(named: imageNameHL, in: EmoticonManager.bundle, compatibleWith: nil)
            
            // 拉伸图像
            let size = image?.size ?? CGSize()
            let inset = UIEdgeInsets(top: size.height * 0.5,
                                     left: size.width * 0.5,
                                     bottom: size.height * 0.5,
                                     right: size.width * 0.5)
            
            image = image?.resizableImage(withCapInsets: inset)
            imageHL = imageHL?.resizableImage(withCapInsets: inset)
            
            btn.setBackgroundImage(image, for: [])
            btn.setBackgroundImage(imageHL, for: .highlighted)
            btn.setBackgroundImage(imageHL, for: .selected)
            
            btn.sizeToFit()
            
            // 3> 添加按钮
            addSubview(btn)
            
            // 4> 设置按钮的 tag
            btn.tag = i
            
            // 5> 添加按钮的监听方法
            // btn.addTarget(self, action: #selector(clickItem), for: .touchUpInside)
        }
        
        // 默认选中第0个按钮
        (subviews[0] as! UIButton).isSelected = true
    }
}
