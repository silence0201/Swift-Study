//
//  MyLabel.swift
//  TextKitDemo
//
//  Created by 杨晴贺 on 2017/3/16.
//  Copyright © 2017年 Silence. All rights reserved.
//

import UIKit

/// 使用TextKit接管Label的底层实现,绘制textStorage的文本内容
/// 使用正则表达式过滤URL
/// 交互
class MyLabel: UILabel {
    
    // MARK: - TextKit的核心对象
    fileprivate lazy var textStorage = NSTextStorage() // 属性文本存储
    fileprivate lazy var layoutManager = NSLayoutManager() // 负责文本字形布局
    fileprivate lazy var textContainer = NSTextContainer() // 设定文字绘制的范围
    
    override var text: String?{
        didSet{
            // 重新准备文本内容
            prepareTextContent()
        }
    }
    
    // MARK: - 方法
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareTextSystem()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepareTextSystem()
    }
    
    // MARK: - 交互
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let location = touches.first?.location(in: self) else{
            return
        }
        
        // 获取当前点钟字符的索引
        let idx = layoutManager.glyphIndex(for: location, in: textContainer)
        print("点我了\(idx)")
        // 判断idx是否在url的rangs范围内买入如果在就高亮
        for r in urlRanges ?? []{
            if NSLocationInRange(idx, r){
                print("需要高亮")
                textStorage.addAttributes([NSForegroundColorAttributeName:UIColor.blue,NSBackgroundColorAttributeName:UIColor.darkGray], range: r)
                setNeedsDisplay()
            }else{
                print("没有点中")
            }
        }
    }
    
    /// 绘制文本
    override func drawText(in rect: CGRect) {
        let rang = NSRange(location: 0, length: textStorage.length)
        
        // 绘制北京
        layoutManager.drawBackground(forGlyphRange: rang, at: CGPoint())
        
        // 绘制字形
        layoutManager.drawGlyphs(forGlyphRange: rang, at: CGPoint())
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // 指定绘制文本的区域
        textContainer.size = bounds.size
    }
}

extension MyLabel{
    /// 准备文本系统
    func prepareTextSystem(){
        // 准备文本的内容
        prepareTextContent()
        
        // 打开交互
        isUserInteractionEnabled = true
        
        // 必须先画背景
        layoutManager.addTextContainer(textContainer)
        
        // 设置关联对象之间的关系
        textStorage.addLayoutManager(layoutManager)
        
    }
    
    /// 准备文本内容
    func prepareTextContent(){
        if let attribute = attributedText{
            textStorage.setAttributedString(attribute)
        }else if let text = text{
            textStorage.setAttributedString(NSAttributedString(string: text))
        }else{
            textStorage.setAttributedString(NSAttributedString(string: ""))
        }
        
        for r in urlRanges ?? []{
            textStorage.addAttributes([NSForegroundColorAttributeName:UIColor.red,NSBackgroundColorAttributeName:UIColor.darkGray], range: r)
        }
    }
}

// MARK: - 正则表达式
fileprivate extension MyLabel{
    var urlRanges:[NSRange]?{
        // 正则表达式
        let pattern = "[a-zA-Z]*://[a-zA-Z0-9/\\.]*"
        
        guard let  regx = try? NSRegularExpression(pattern: pattern, options: []) else{
            return nil
        }
        
        
        let matchs =  regx.matches(in: textStorage.string, options: [], range: NSRange(location: 0, length: textStorage.length))
        
        var rangs = [NSRange]()
        
        for m in matchs{
            rangs.append(m.rangeAt(0))
        }
        
        return rangs
    }
}
