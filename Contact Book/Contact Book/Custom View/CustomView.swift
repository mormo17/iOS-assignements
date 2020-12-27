//
//  CustomView.swift
//  Contact Book
//
//  Created by Mariam on 12/23/20.
//

import UIKit

class CustomView: UICollectionViewCell{
//    static let identifier = "CustomView"
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var circle: UIView!
    @IBOutlet weak var initials: UILabel!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var contactName: UILabel!
    //    static func nib() -> UINib{
//        return UINib(nibName: identifier, bundle: nil)
//    }

    func configure(with initialsText: String, with numberText: Int64, with contactNameText: String){
        setUpCircle(with: initialsText)
        setUpNumber(with: numberText)
        setUpContactName(with: contactNameText)
        setUpMainView()
        setUpContentView()
    }
    
    func setUpCircle(with initialsText: String){
        circle.layer.cornerRadius = circle.frame.size.height/2
        
        circle.layer.masksToBounds = true
        circle.backgroundColor = .systemGray5
        
        initials.text = initialsText
        circle.addSubview(initials)
    }
    
    func setUpNumber(with numberText: Int64){
        number.text = String(numberText)
    }
    
    func setUpContactName(with contactNameText: String){
        contactName.text = contactNameText
    }
    
    func setUpMainView(){
        mainView.addSubview(circle)
        mainView.addSubview(number)
        mainView.addSubview(contactName)
    }
    
    func setUpContentView(){
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.systemGray3.cgColor
        contentView.layer.cornerRadius = 10
    }
    
}
