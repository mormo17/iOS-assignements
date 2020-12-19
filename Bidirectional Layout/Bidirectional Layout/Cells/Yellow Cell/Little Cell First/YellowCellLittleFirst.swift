//
//  YellowCellBlock.swift
//  Bidirectional Layout
//
//  Created by Mariam on 12/19/20.
//

import UIKit

class YellowCellLittleFirst: UICollectionViewCell {
    static let identifier = "YellowCellLittleFirst"
    
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
}
