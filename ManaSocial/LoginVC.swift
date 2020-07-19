//
//  LoginVC.swift
//  ManaSocial
//
//  Created by Mahmoud Abu Obaid on 7/14/20.
//  Copyright © 2020 Mahmoud Abu Obaid. All rights reserved.
//

import UIKit

class LoginVC: MVC {

    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    @IBAction func onLoginBtnClicked(_ sender: Any)
    {
        if checkIsEmpty( textField: emailTxt )
        {
            return
        }
        
        if checkIsEmpty( textField: passwordTxt )
        {
            return
        }
        
        ServerAccess.loginUser( email: emailTxt.text!.lowercased(), password: passwordTxt.text! )
    }
    
    @IBAction func onForgetPasswordBtnClicked(_ sender: Any)
    {
        moveToViewController( from: self, toID: "resetPasswordVC" )
    }
    
    @IBAction func onRegisterBtnClicked(_ sender: Any)
    {
        moveToViewController( from: self, toID: "registerVC" )
    }
}
