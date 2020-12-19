//
//  YellowCellBlock.swift
//  Bidirectional Layout
//
//  Created by Mariam on 12/19/20.
//

import UIKit

class YellowCellLittleFirst: UICollectionViewCell {
    static let nibName = "YellowCellLittleFirst"
    static let identifier = "YellowCellLittleFirst"
    
    static func nib() -> UINib{
        return UINib(nibName: nibName, bundle: nil)
    }
}
