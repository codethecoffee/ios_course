//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        // OPTIONAL CHAINING
        // Now the Auth.auth().createUser method is called only if both the email and password
        // variables are not nil after unpacking.
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                // If there was an error (you can also give user feedback in a pop up
                if let e = error {
                    // TODO: Add a pop up that displays this localized description
                    print(e.localizedDescription)
                } else {
                    // Navigate to the chat view controller
                    self.performSegue(withIdentifier: "registerToChat", sender: self)
                }
            }
        }
    }
    
}
