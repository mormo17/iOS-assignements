//
//  ViewController.swift
//  Burger Menu
//
//  Created by Mariam on 12/7/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var stack: UIStackView!
    @IBOutlet var mainView: UIView!
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var button: UIBarButtonItem!
   
    @IBOutlet weak var label: UILabel!
    
    var menuIsVisible = false
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        for button in buttons{
            button.isHidden = true
            button.contentHorizontalAlignment = .left
            button.layer.backgroundColor = UIColor.white.cgColor
           
            button.addTarget(self, action: #selector(goToNowhere), for: .touchUpInside)
            
        }
        button.image = UIImage(systemName: "moon.fill")
        mainView.backgroundColor = UIColor.white
        topView.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        topView.isHidden = true
        label.text = "Touch The Moon"
    }
    
    @IBAction func goToNowhere(_ sender: Any){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nowhere = storyBoard.instantiateViewController(withIdentifier: "Nowhere") as! UITabBarController
        self.navigationController?.pushViewController(nowhere, animated: true)
    }

    @IBAction func menuTapped(_ sender: Any) {
        menuIsVisible = !menuIsVisible
        buttons.forEach{ (button) in
            UIView.animate(withDuration: 0.5, animations: {button.isHidden = !button.isHidden})
            self.view.layoutIfNeeded()
        }
        
        if menuIsVisible{
            button.image = UIImage(systemName: "sun.min.fill")
            topView.isHidden = false
            mainView.bringSubviewToFront(topView)
            label.text = "Test that I dont hide Main View"
        } else {
            topView.isHidden = true
            button.image = UIImage(systemName: "moon.fill")
            label.text = "Touch The Moon"
        }
    }
    
}

