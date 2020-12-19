//
//  RedCell.swift
//  Bidirectional Layout
//
//  Created by Mariam on 12/19/20.
//

import UIKit

class RedCell: UITableViewCell {
    static let nibName = "RedCell"
    static let identifier = "RedCell"
    
    static func nib() -> UINib{
        return UINib(nibName: nibName, bundle: nil)
    }
}
