//
//  BlueCell.swift
//  Bidirectional Layout
//
//  Created by Mariam on 12/19/20.
//

import UIKit

class BlueCell: UITableViewCell {
    static let identifier = "BlueCell"
    
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
}
