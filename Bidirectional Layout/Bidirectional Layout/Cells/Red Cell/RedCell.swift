//
//  RedCell.swift
//  Bidirectional Layout
//
//  Created by Mariam on 12/19/20.
//

import UIKit

class RedCell: UITableViewCell {
    static let identifier = "RedCell"
    
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
}
