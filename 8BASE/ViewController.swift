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
var cacatexto = ""
//MARK: Properties
    
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
    }


}

