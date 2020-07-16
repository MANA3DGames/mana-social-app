//
//  ViewController.swift
//  ManaSocial
//
//  Created by Mahmoud Abu Obaid on 7/9/20.
//  Copyright © 2020 Mahmoud Abu Obaid. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController
{
    // UI element objects.
    @IBOutlet weak var firstNameTxt: UITextField!       // User's first name ui input field.
    @IBOutlet weak var lastNameTxt: UITextField!        // User's last name ui input field.
    @IBOutlet weak var passwordTxt: UITextField!        // User's password ui input field.
    @IBOutlet weak var repasswordTxt: UITextField!      // User's confirm-password ui input field.
    @IBOutlet weak var emailTxt: UITextField!           // User's email ui input field.
    
    
    // Startup function.
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    // Registers a new user with hard-coded parameters - just for testing.
    func quickRegistration()
    {
        let email = "kingodesu@gmail.com"
        let password = "1234"
        let firstName = "Amanda"
        let lastName = "AbuObaid"

        ServerAccess.registerUser(email: email, password: password, firstName: firstName, lastName: lastName)
    }
    
    
    
    // To be called when register btn is clicked.
    @IBAction func onClickRegisterBtn(_ sender: Any)
    {
        // check first name field.
        if UIUtilities.checkIsEmpty( textField: firstNameTxt )
        {
            return
        }
        
        // Check last name field.
        if UIUtilities.checkIsEmpty( textField: lastNameTxt )
        {
            return
        }

        // Check email field.
        if UIUtilities.checkIsEmpty( textField: emailTxt )
        {
            return
        }

        // Check password field.
        if UIUtilities.checkIsEmpty( textField: passwordTxt )
        {
            return
        }
        // Check re-password field.
        if UIUtilities.checkIsEmpty( textField: repasswordTxt )
        {
            return
        }
        
        // Check if password is confirmed correctly?
        if passwordTxt.text != repasswordTxt.text
        {
            repasswordTxt.text = ""
            return;
        }
        
        // All registration fields were filled.
        ServerAccess.registerUser(
            email: emailTxt.text!.lowercased(),
            password: passwordTxt.text!,
            firstName: firstNameTxt.text!,
            lastName: lastNameTxt.text! )
    }
    
}
