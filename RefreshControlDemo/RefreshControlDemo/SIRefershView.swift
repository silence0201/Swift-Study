//
//  SIRefershView.swift
//  RefreshControlDemo
//
//  Created by 杨晴贺 on 2017/3/15.
//  Copyright © 2017年 Silence. All rights reserved.
//

import UIKit

/// 刷新视图,负责刷新相关的UI显示
class SIRefershView: UIView {
    /// 提示图标
    @IBOutlet weak var tipIcon: UIImageView!
    /// 提示标签
    @IBOutlet weak var tipLabel: UILabel!
    /// 指示器
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    /// 刷新状态
    var refreshStatus: SIRefershStatus = .Normal{
        didSet{
            switch refreshStatus {
            case .Normal:
                tipLabel.text = "继续使劲拉"
                // 恢复状态
                tipIcon.isHidden = false
                indicator.stopAnimating()
                UIView.animate(withDuration: 0.25, animations: { 
                    self.tipIcon.transform = CGAffineTransform.identity
                })
                
            case .Pulling:
                tipLabel.text = "放手刷新"
                UIView.animate(withDuration: 0.25, animations: {
                    /// 要想实现同方向旋转,需要调整一个十分小的数字,为了更近
                    self.tipIcon.transform = CGAffineTransform(rotationAngle: (CGFloat)(M_PI-0.001))
                })
            case .WillRefresh:
                tipLabel.text = "开始刷新"
                
                // 隐藏提示图片,显示菊花
                tipIcon.isHidden = true ;
                indicator.startAnimating()
            }
        }
    }
    
    class func refreshView() -> SIRefershView{
        let nib = UINib(nibName: "SIRefershView", bundle: nil)
        return nib.instantiate(withOwner: nil, options: nil)[0] as! SIRefershView
    }
}
