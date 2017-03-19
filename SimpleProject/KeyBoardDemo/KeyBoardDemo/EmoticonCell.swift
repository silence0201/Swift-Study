//
//  EmoticonCell.swift
//  KeyBoardDemo
//
//  Created by 杨晴贺 on 2017/3/17.
//  Copyright © 2017年 Silence. All rights reserved.
//

import UIKit

@objc protocol EmoticonCellDelegate: NSObjectProtocol{
    func emoticonCellDidSelectedEmoticon(cell: EmoticonCell,em: Emoticon?) ;
}

class EmoticonCell: UICollectionViewCell {
    
    weak var delegate: EmoticonCellDelegate?
    
    /// 当前页面的表情模型数组，`最多` 20 个
    var emoticons: [Emoticon]? {
        didSet {
            print("表情包的数量 \(emoticons?.count)")
            // 1. 隐藏所有的按钮
            for v in contentView.subviews {
                v.isHidden = true
            }
            // 显示删除按钮
            contentView.subviews.last?.isHidden = false
            // 2. 遍历表情模型数组，设置按钮图像
            for (i, em) in (emoticons ?? []).enumerated() {
                // 1> 取出按钮
                if let btn = contentView.subviews[i] as? UIButton {
                    // 设置图像 - 如果图像为 nil 会清空图像，避免复用
                    btn.setImage(em.image, for: [])
                    // 设置 emoji 的字符串 - 如果 emoji 为 nil 会清空 title，避免复用
                    btn.setTitle(em.emoji, for: [])
                    btn.isHidden = false
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EmoticonCell{
    // - 从 XIB 加载，bounds 是 XIB 中定义的大小，不是 size 的大小
    // - 从纯代码创建，bounds 是就是布局属性中设置的 itemSize
    fileprivate func setupUI(){
        let rowCount = 3
        let colCount = 7
        
        // 左右间距
        let leftMargin: CGFloat = 8
        // 底部间距，为分页控件预留空间
        let bottomMargin: CGFloat = 16
        
        let w = (bounds.width - 2 * leftMargin) / CGFloat(colCount)
        let h = (bounds.height - bottomMargin) / CGFloat(rowCount)
        
        // 连续创建 21 个按钮
        for i in 0..<21 {
            let row = i / colCount
            let col = i % colCount
            
            let btn = UIButton()
            
            // 设置按钮的大小
            let x = leftMargin + CGFloat(col) * w
            let y = CGFloat(row) * h
            
            btn.frame = CGRect(x: x, y: y, width: w, height: h)
            
            contentView.addSubview(btn)
            
            // 设置按钮的字体大小，lineHeight 基本上和图片的大小差不多！
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 32)
            
            // 设置按钮的 tag
            btn.tag = i
            // 添加监听方法
            btn.addTarget(self, action: #selector(selectedEmoticonButton), for: .touchUpInside)
        }
        
        // 取出末尾的删除按钮
        let removeButton = contentView.subviews.last as! UIButton
        
        // 设置图像
        let image = UIImage(named: "compose_emotion_delete_highlighted", in: EmoticonManager.bundle, compatibleWith: nil)
        removeButton.setImage(image, for: [])
        
        // 添加长按手势
        //let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longGesture))
        
        //longPress.minimumPressDuration = 0.1
        //addGestureRecognizer(longPress)
    }
}

extension EmoticonCell{
    @objc fileprivate func selectedEmoticonButton(button: UIButton){
        // 取tag
        let tag = button.tag
        // 根据tag判断是否是删除按钮,如果不是删除按钮,取得表情
        var em: Emoticon?
        if tag < emoticons?.count ?? 0 {
            em = emoticons?[tag]
        }
        delegate?.emoticonCellDidSelectedEmoticon(cell: self, em: em)
    }
}
