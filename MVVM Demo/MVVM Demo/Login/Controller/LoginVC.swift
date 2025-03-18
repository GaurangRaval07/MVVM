//
//  LoginVC.swift
//  MVVM Demo
//
//  Created by Gauarang Raval on 18/03/25.
//

import UIKit

class LoginVC: UIViewController {
    
    // MARK: - IBOUTLETS
    @IBOutlet weak var vwEmail: UIView!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var vwPassword: UIView!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    // MARK: - VARIABLES
    let loginViewModel = ViewModel()
    
    // MARK: - MAIN METHODS
    override func viewDidLoad() {
        configureUI()
    }
    
    // MARK: - FUNCTION
    func configureUI() {
        self.vwEmail.layer.cornerRadius = 8
        self.vwEmail.layer.borderWidth = 1
        self.vwPassword.layer.cornerRadius = 8
        self.vwPassword.layer.borderWidth = 1
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default))
        present(alert, animated: true)
    }
    
    // MARK: - IBACTIONS
    @IBAction func btnLogin(_ sender: UIButton) {
        guard let email = tfEmail.text, !email.isEmpty, let password = tfPassword.text, !password.isEmpty else {
            showAlert(message: "Please Enter Email and Password")
            return
        }
        // Save user login details
        loginViewModel.saveUserData(email: email, password: password)
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.setRootViewController()
        }
    }
}

