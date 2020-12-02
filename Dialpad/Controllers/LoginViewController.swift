//
//  LoginViewController.swift
//  Dialpad
//
//  Created by Mariam on 12/1/20.
//

import UIKit



class LoginViewController: UIViewController {
    @IBOutlet weak var email: CustomTextField!
    @IBOutlet weak var password: CustomTextField!
    
    @IBOutlet weak var centerY: NSLayoutConstraint!
    private var keyboardIsVisible = false
    
    @IBOutlet weak var forgotPassword: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    let defaultEmail = "test@mail.com"
    let defaultPassword = "1234"
    let button = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForKeyboardNotifications()
        customizeView()
        setUpDelegates()
//        let tap: UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(keyboardWillHide(_:)))
//        self.view.addGestureRecognizer(tap)
     }
    
    private func setUpDelegates(){
        email.delegate = self
        password.delegate = self
        email.textField.delegate = self
        password.textField.delegate = self
    }

    private func customizeView(){
        customizeTextFields()
        customizeButtons()
    }

    private func customizeTextFields(){
        customizeEmailTextField()
        customizePasswordTextField()
    }
    
    private func customizeEmailTextField(){
        email.label.text = "Email"
        email.textField.placeholder = "Enter Email"
        email.image.setImage(UIImage(systemName: "envelope.fill"), for: .normal)
    }
    
    private func customizePasswordTextField(){
        password.label.text = "Password"
        password.textField.placeholder = "Enter Password"
        password.textField.isSecureTextEntry = true
        
        password.image.setImage(UIImage(systemName: "lock.fill"), for: .normal)
        
        password.textField.rightViewMode = .always
        button.addTarget(self, action: #selector(passwordVisibilityClicked), for: .touchUpInside)
        button.setBackgroundImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        password.textField.rightView = button
        password.textField.rightViewMode = .always
    }
        
    @IBAction func passwordVisibilityClicked(_ sender: Any){
        if(password.textField.isSecureTextEntry == true){
            password.textField.isSecureTextEntry = false
            button.setBackgroundImage(UIImage(systemName: "eye.fill"), for: .normal)
        } else{
            password.textField.isSecureTextEntry = true
            button.setBackgroundImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        }
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

        centerY.constant -= height * 0.5

        UIView.animate(withDuration: 1, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 10.0, options: [], animations: {self.view.layoutIfNeeded()}, completion: nil)
        keyboardIsVisible = true
    }

    private func reserUI(){
        keyboardIsVisible = false
        centerY.constant = 0
        self.view.frame.origin.y = 0
        //self.view.endEditing(true)
    }
    
    @IBAction func goToDialPad(){
        if(self.email.textField.text == self.defaultEmail && self.password.textField.text == self.defaultPassword){
            let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
            let dialpad = mainStoryBoard.instantiateViewController(identifier: "tabBarController")
            self.present(dialpad, animated: true, completion: nil)
        } else{
            self.email.resignFirstResponder()
        }
    }
}


extension LoginViewController: UITextFieldDelegate, CustomTextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    func customTextFieldClicked(textField: UITextField) {
        
    }
}
