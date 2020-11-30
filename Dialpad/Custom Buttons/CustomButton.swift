//
//  CustomButton.swift
//  Dialpad
//
//  Created by Mariam on 11/23/20.
//

import UIKit

protocol CustomButtonDelegate: AnyObject {
    func customButtonClicked(button: UIButton);
}

class CustomButton : UIView{
    @IBOutlet var contentView: UIView!
    @IBOutlet var button: UIButton!
    @IBOutlet weak var label: UILabel!
    weak var delegate: CustomButtonDelegate?
    
    override init(frame: CGRect){
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit(){
        let bundle = Bundle(for: CustomButton.self)
        bundle.loadNibNamed("CustomButton", owner: self, options: nil)
        
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(contentView)
    }
    
    @IBAction func clicked(){
        delegate?.customButtonClicked(button: self.button)
    }
}
