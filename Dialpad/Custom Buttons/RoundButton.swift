//
//  Button.swift
//  Dialpad
//
//  Created by Mariam on 11/14/20.
//

import UIKit

class RoundButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(white: 1.0, alpha: 0).cgColor
        self.titleLabel?.textColor = UIColor.black
        self.backgroundColor = UIColor.lightGray
        self.tintColor = UIColor.black
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }

}
