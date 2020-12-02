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
    
    @IBOutlet weak var forgotPassword: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    let defaultEmail = "test@mail.com"
    let defaultPassword = "1234"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForKeyboardNotifications()
        customizeView()
        email.delegate = self
        password.delegate = self
     }
    
    private func customizeView(){
        customizeTextFields()
        customizeButtons()
    }
    
    private func customizeTextFields(){
        email.layer.cornerRadius = 5
        password.layer.cornerRadius = 5
    }
    
    private func customizeButtons(){
        customizeForgotButton()
        customizeLoginButton()
        customizeSignupButton()
    }
    
    private func customizeForgotButton(){
        forgotPassword.contentHorizontalAlignment = .right
    }
    
    private func customizeLoginButton(){
        loginButton.backgroundColor = .blue
        loginButton.layer.cornerRadius = 5
        
    }
    
    private func customizeSignupButton(){
        signupButton.backgroundColor = .clear
        signupButton.layer.cornerRadius = 5
        signupButton.layer.borderWidth = 1
        signupButton.layer.borderColor = UIColor.blue.cgColor
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
        centerY.constant -= height * 0.75
        UIView.animate(withDuration: 1, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 10.0, options: [], animations: {self.view.layoutIfNeeded()}, completion: nil)
        keyboardIsVisible = true
    }
    
    private func reserUI(){
        keyboardIsVisible = false
        centerY.constant = 0
    }
    
    @IBAction func goToDialPad(){
        if(self.email.text == self.defaultEmail && self.password.text == self.defaultPassword){
            let mainStoryBoard = UIStoryboard(name: "", bundle: nil)
        }
    }
}

extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
