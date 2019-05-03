//
//  ViewController.swift
//  8BASE
//
//  Created by Carlos Leniz on 5/3/19.
//  Copyright © 2019 Carlos Leniz. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {
//MARK: Properties
    
    @IBOutlet weak var labelGuardar: UILabel!
    @IBOutlet weak var botonGuardar: UIButton!
    @IBOutlet weak var casillaGuardar: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let ref = Database.database().reference()
        ref.child("81/caca1/caca2").setValue("check")

        
    }
    @IBAction func click(_ sender: Any) {
        let ref = Database.database().reference()
        ref.child("81/caca1/caca2").setValue("\(casillaGuardar.text!)")
        ref.child("82/Cajonera 1/Generador/Estado").observeSingleEvent(of: .value) { (datoEstado) in
            
            if datoEstado.value as? Bool == false{
                self.labelGuardar.textColor = UIColor.red
            }else {
                self.labelGuardar.textColor = UIColor.green
            }

        }

    }


}

