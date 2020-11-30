//
//  ViewController.swift
//  Dialpad
//
//  Created by Mariam on 11/14/20.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var numberField: UILabel!
    @IBOutlet var buttons: [CustomButton]!
    
    var number: String = ""
    var labelstoSet: [String] = ["+", "", "ABC", "DEF", "GHI", "JKL", "MNO", "PQRS", "TUV", "WXYZ"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for (i, _) in buttons.enumerated(){
            if(i == 10){
                buttons[i].button.setTitle("*", for: .normal)
            } else if(i == 11){
                buttons[i].button.setTitle("#", for: .normal)
            } else{
                buttons[i].button.setTitle(String(i), for: .normal)
                buttons[i].label.text = labelstoSet[i]
            }
            buttons[i].button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            buttons[i].delegate = self
        }
    }
    
    
    func formatNumber() -> String{
        var result = "   "
        
        for (i, char) in number.enumerated() {
            if (i % 3 == 0 && i != 0) {
                result+="   "
            }
            
            result += String(char)
        }
        return result
    }
    
    
    @IBAction func deleteClicked(_ sender: UIButton) {
        number = String(number.dropLast())
        var textToSet = formatNumber()
        numberField.text = textToSet
    }

    
}

extension HomeViewController: CustomButtonDelegate{
    func customButtonClicked(button: UIButton) {
        print(button.currentTitle!)
        var fieldText = numberField.text
        
        var digitPressed = button.currentTitle!
        number = number.appending(digitPressed)
        var textToSet = formatNumber()
        
        numberField.text = textToSet
    }
}
