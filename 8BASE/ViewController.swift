//
//  ViewController.swift
//  8BASE
//
//  Created by Carlos Leniz on 5/3/19.
//  Copyright © 2019 Carlos Leniz. All rights reserved.
//

import UIKit
import Firebase


class ViewController: UIViewController {

    @IBOutlet weak var textoUsuario: UITextField!
    @IBOutlet weak var textoPass: UITextField!
    
    @IBAction func LogIn(_ sender: Any) {
        if let email = self.textoUsuario.text, let password = self.textoPass.text {
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if error == nil{
                    self.performSegue(withIdentifier: "LoggedIn", sender: self)
                }
                else{
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                
             }
        }
        
    }
   
    }
    
 }

    




