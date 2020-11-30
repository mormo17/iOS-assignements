//
//  ViewController.swift
//  Login
//
//  Created by Mariam on 11/30/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var centerY: NSLayoutConstraint!
    private var originalCenterY: NSLayoutConstraint!
    private var keyboardIsVisible = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        registerForKeyboardNotifications()
        
        email.delegate = self
        password.delegate = self
     }
     
     override func viewWillDisappear(_ animated: Bool) {
       super.viewWillDisappear(true)
       unregisterForKeyboardNofications()
     }

     private func registerForKeyboardNotifications() {
       NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)

       NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
     }

     private func unregisterForKeyboardNofications() {
       NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
       NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
     }
     
     @objc private func keyboardWillShow(_ notification: NSNotification) {
        

       guard let keyboardFrame = notification.userInfo?["UIKeyboardFrameBeginUserInfoKey"] as? CGRect else {
         return
       }
       
        moveKeyboardUp(keyboardFrame.size.height)
        
        
     }

     @objc private func keyboardWillHide(_ notification: NSNotification) {
        reserUI()
     }
    

    private func moveKeyboardUp(_ height: CGFloat){
        if keyboardIsVisible {return}
        originalCenterY = centerY
        centerY.constant -= height
        UIView.animate(withDuration: 1, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 10.0, options: [], animations: {self.view.layoutIfNeeded()}, completion: nil)
        keyboardIsVisible = true
    }
    
    private func reserUI(){
        keyboardIsVisible = false
        centerY.constant -= originalCenterY.constant
    }
}

extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
