//
//  ViewController.swift
//  Practice
//
//  Created by PAVIT KALRA on 2022-10-18.
//

import UIKit

class LoginVC: UIViewController {

    
    @IBOutlet weak var emailtxt: UITextField!
    
    @IBOutlet weak var passwordtxt: UITextField!
    
    @IBOutlet weak var rememberSwitch: UISwitch!
    
    
    @IBOutlet weak var SignInBtn: UIButton!
    
    @IBOutlet weak var SignUpBtn: UIButton!
    
    
    
    private func validateUser() -> Bool {
        if emailtxt.text == "test" && passwordtxt.text == "test"{
            return true
        } else {
            return false
        }
    }
    
    
    
    @IBAction func SignIn(_ sender: UIButton) {
        if validateUser(){
            
            if rememberSwitch.isOn {
                //save the data
                UserDefaults.standard.set(emailtxt.text!, forKey: "email")
                UserDefaults.standard.set(passwordtxt.text!, forKey: emailtxt.text!)
            } else{
                UserDefaults.standard.removeObject(forKey: "email")
                UserDefaults.standard.removeObject(forKey: emailtxt.text!)
            }
            
            
            //open home screen
            let mainSB : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let homeVC = mainSB.instantiateViewController(withIdentifier: "HomeScene")
            
            navigationController?.pushViewController(homeVC, animated: true)
        } else {
            let infoAlert = UIAlertController(title: "User Account", message: "Invalid Email and/or Password", preferredStyle: .alert)
            infoAlert.addAction((UIAlertAction(title: "Retry", style: .default, handler: nil)))
            infoAlert.addAction((UIAlertAction(title: "Cancel", style: .cancel, handler: nil)))
            
            present(infoAlert, animated: true) { [weak self] in
                self?.emailtxt.text = ""
                self?.passwordtxt.text = ""
            }
        }
    }
    
    @IBAction func SignUp(_ sender: UIButton) {
        //TODO: TOMORROW
    }
    
    
}

