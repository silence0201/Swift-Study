//
//  EmoticonLayout.swift
//  KeyBoardDemo
//
//  Created by 杨晴贺 on 2017/3/17.
//  Copyright © 2017年 Silence. All rights reserved.
//

import UIKit

class EmoticonLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else {
            return
        }
        
        itemSize = collectionView.bounds.size
        
        // 设置滚动方向
        scrollDirection = .horizontal
        
    }
}
