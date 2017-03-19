//
//  EmoticonView.swift
//  KeyBoardDemo
//
//  Created by 杨晴贺 on 2017/3/17.
//  Copyright © 2017年 Silence. All rights reserved.
//

import UIKit

fileprivate let cellId = "cellID"
/// 表情输入视图
class EmoticonView: UIView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var toolBar: EmoticonToolBar!
    
    fileprivate var selectedEmoticonCallBlock:((Emoticon?)->Void)?
    
    static func inputView(selectedEmoticon:@escaping (Emoticon?)->Void) -> EmoticonView{
        let nib = UINib(nibName: "EmoticonView", bundle: nil)
        let v = nib.instantiate(withOwner: nil, options:nil)[0] as! EmoticonView
        v.selectedEmoticonCallBlock = selectedEmoticon
        return v
    }
    
    override func awakeFromNib() {
        collectionView.register(EmoticonCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.backgroundColor = UIColor.white
    }
}

extension EmoticonView: UICollectionViewDelegate{
    
}

extension EmoticonView: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return EmoticonManager.shared.packages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return EmoticonManager.shared.packages[section].numberOfPages
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! EmoticonCell
        cell.emoticons = EmoticonManager.shared.packages[indexPath.section].emoticon(page: indexPath.item)
        cell.delegate = self
        return cell
    }
}

extension EmoticonView: EmoticonCellDelegate{
    func emoticonCellDidSelectedEmoticon(cell: EmoticonCell, em: Emoticon?) {
        selectedEmoticonCallBlock?(em)
    }
}
