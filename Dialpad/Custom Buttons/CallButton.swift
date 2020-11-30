//
//  CallButton.swift
//  Dialpad
//
//  Created by Mariam on 11/23/20.
//

import UIKit

class CallButton: UIButton {

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
        self.backgroundColor = UIColor.green
        self.tintColor = UIColor.white
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }

}
