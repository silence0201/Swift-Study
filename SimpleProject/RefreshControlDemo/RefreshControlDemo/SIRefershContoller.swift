//
//  SIRefershContoller.swift
//  RefreshControlDemo
//
//  Created by 杨晴贺 on 2017/3/15.
//  Copyright © 2017年 Silence. All rights reserved.
//

import UIKit

/// 刷新临界值
fileprivate let RefreshOffSet: CGFloat = 60

/// 刷新状态
///
/// - Normal:      普通状态，什么都不做
/// - Pulling:     超过临界点，如果放手，开始刷新
/// - WillRefresh: 用户超过临界点，并且放手
enum SIRefershStatus{
    case Normal
    case Pulling
    case WillRefresh
}

/// 刷新相关的逻辑
class SIRefershContoller: UIControl{
    
    // MARK: - 属性
    /// 刷新控件的父视图
    fileprivate weak var scrollView: UIScrollView?
    
    fileprivate lazy var refreshView: SIRefershView = SIRefershView.refreshView()
    
    init() {
        super.init(frame: CGRect())
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    
    /// 开始刷新
    func beginRefreshing(){
        print("开始刷新")
        
        // 判断父视图
        guard let sv = scrollView else {
            return
        }
        
        // 如果正在刷新,则返回
        if refreshView.refreshStatus == .WillRefresh{
            return
        }
        
        // 设置刷新视图的状态
        refreshView.refreshStatus = .WillRefresh
        
        // 调整表格间距,让整个刷新视图能显示出来
        var inset = sv.contentInset
        inset.top += RefreshOffSet
        sv.contentInset = inset
        
        
    }
    
    /// 结束刷新
    func endRefreshing(){
        print("结束刷新")
        
        // 判断父视图
        guard let sv = scrollView else {
            return
        }
        
        // 判断状态，是否正在刷新，如果不是，直接返回
        if refreshView.refreshStatus != .WillRefresh{
            return
        }
        
        // 恢复刷新视图状态
        refreshView.refreshStatus = .Normal
        
        // 恢复表格表格的contentinset
        var inset = sv.contentInset
        inset.top -= RefreshOffSet
        sv.contentInset = inset
    }
    
    /// willMove addSubview方法会调用
    /// 当添加到父视图的时候,newSupview是父视图
    /// 当父视图被移除,newSupview是nil
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        
        // 判断父视图的类型
        guard let sv = newSuperview as? UIScrollView else {
            return
        }
        scrollView = sv ;
        
        // KVO 监听父视图的contentOffset
        scrollView?.addObserver(self, forKeyPath: "contentOffset", options: [], context: nil)
    }
    
    override func removeFromSuperview() {
        scrollView?.removeObserver(self, forKeyPath: "contentOffset")
        super.removeFromSuperview()
        
    }
    
    // 所有KVO会调用这个方法
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard let sv = scrollView else {
            return
        }
        let height = -(sv.contentInset.top + sv.contentOffset.y)
        self.frame = CGRect(x: 0, y: -height, width: sv.bounds.width, height: height)
        
        // 判断零界点
        if sv.isDragging{
            if height > RefreshOffSet && refreshView.refreshStatus == .Normal{
                refreshView.refreshStatus = .Pulling
                print("放手刷新")
            }else if height <= RefreshOffSet &&  refreshView.refreshStatus == .Pulling{
                refreshView.refreshStatus = .Normal
                print("接着拉")
            }
        }else{
            // 放手
            if refreshView.refreshStatus == .Pulling{
                print("准备开始刷新")
                beginRefreshing()
                sendActions(for: .valueChanged)
            }
        }
    }
}

extension SIRefershContoller{
    fileprivate func setupUI(){
        backgroundColor = superview?.backgroundColor
        addSubview(refreshView)
        
        // 自动布局
        refreshView.translatesAutoresizingMaskIntoConstraints = false ;
        addConstraint(NSLayoutConstraint(item: refreshView,
                                         attribute: .centerX,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .centerX,
                                         multiplier: 1.0,
                                         constant: 0))
        
        addConstraint(NSLayoutConstraint(item: refreshView,
                                         attribute: .bottom,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .bottom,
                                         multiplier: 1.0,
                                         constant: 0))
        
        addConstraint(NSLayoutConstraint(item: refreshView,
                                         attribute: .width,
                                         relatedBy: .equal,
                                         toItem: nil,
                                         attribute: .notAnAttribute,
                                         multiplier: 1.0,
                                         constant: refreshView.bounds.width))
        addConstraint(NSLayoutConstraint(item: refreshView,
                                         attribute: .height,
                                         relatedBy: .equal,
                                         toItem: nil,
                                         attribute: .notAnAttribute,
                                         multiplier: 1.0,
                                         constant: refreshView.bounds.height))
    }
}
