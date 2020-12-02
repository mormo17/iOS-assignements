//
//  CustomTextField.swift
//  Dialpad
//
//  Created by Mariam on 12/2/20.
//

import UIKit

protocol CustomTextFieldDelegate: AnyObject{
    func customTextFieldClicked(textField: UITextField);
}

class CustomTextField: UIView{
    @IBOutlet var contentView: UIView!
    @IBOutlet var label: UILabel!
    @IBOutlet var textField: UITextField!
    @IBOutlet var image: UIButton!
    weak var delegate: CustomTextFieldDelegate?
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
        bundle.loadNibNamed("CustomTextField", owner: self, options: nil)
        
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        contentView.layer.cornerRadius = 5
        image.isEnabled = false
        label.textColor = .blue
        textField.textColor = .blue
        textField.layer.cornerRadius = 5
        addSubview(contentView)
    }
    
    @IBAction func clicked(){
        delegate?.customTextFieldClicked(textField: self.textField)
    }
}
