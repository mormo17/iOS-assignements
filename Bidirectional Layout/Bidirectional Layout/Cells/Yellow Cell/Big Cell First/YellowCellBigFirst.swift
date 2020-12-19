//
//  YellowCellBlockReversed.swift
//  Bidirectional Layout
//
//  Created by Mariam on 12/19/20.
//

import UIKit

class YellowCellBigFirst: UICollectionViewCell {
    static let nibName = "YellowCellBigFirst"
    static let identifier = "YellowCellBigFirst"
    
    static func nib() -> UINib{
        return UINib(nibName: nibName, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
