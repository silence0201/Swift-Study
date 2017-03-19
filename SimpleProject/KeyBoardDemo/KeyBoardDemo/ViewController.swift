//
//  ViewController.swift
//  KeyBoardDemo
//
//  Created by 杨晴贺 on 2017/3/17.
//  Copyright © 2017年 Silence. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    lazy var emoticonView:EmoticonView = EmoticonView.inputView { [weak self] (em) in
        self?.insertEmoticon(em:em)
    }
    
    func insertEmoticon(em:Emoticon?){
        guard let em = em else {
            textView.deleteBackward()
            return
        }
        
        // emoji 字符串
        if let emoji = em.emoji,let textRang = textView.selectedTextRange{
            textView.replace(textRang, withText: emoji)
            return
        }
        
        // 插入图片
        let imageText = em.imageText(font: textView.font!)
        
        // 记录原来的光标
        let rang: NSRange = textView.selectedRange
        
        // 插入图片
        let attrM = NSMutableAttributedString(attributedString: textView.attributedText)
        // 插入到光标位置
        attrM.replaceCharacters(in: rang, with: imageText)
        // 设置属性文本
        textView.attributedText = attrM
        // 回复光标位置
        textView.selectedRange = NSRange(location:rang.location+1, length: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.inputView = emoticonView
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textView.resignFirstResponder()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        textView.becomeFirstResponder()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        textView.resignFirstResponder()
    }
    
    @IBAction func show(_ sender: Any) {
        print(attrStr)
    }
    
    var attrStr: String{
        
        var result = String()
        guard let attr = textView.attributedText else{
            return ""
        }
        
    attr.enumerateAttributes(in: NSRange(location: 0, length: attr.length), options: []) { (dict, rang, _) in
//        print("rang:\(rang.location)--\(rang.length) dic:\(dict)")
            if let attachment = dict["NSAttachment"] as? EmoticonAttachment{
                result += attachment.chs ?? ""
            }else{
                let subStr = (attr.string as NSString).substring(with: rang)
                result += subStr
            }
        }
        
        return result
    }
    


}

