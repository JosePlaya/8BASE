//
//  ViewController.swift
//  8BASE
//
//  Created by Carlos Leniz on 5/3/19.
//  Copyright © 2019 Carlos Leniz. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
let ref = Database.database().reference()

class ViewController: UIViewController {
//MARK: Properties
    var db:  Firestore!
    
    @IBOutlet weak var labelGuardar: UILabel!
    @IBOutlet weak var botonGuardar: UIButton!
    @IBOutlet weak var casillaGuardar: UITextField!
    override func viewDidLoad() {
        
            super.viewDidLoad()
            
            // [START setup]
            let settings = FirestoreSettings()
            
            Firestore.firestore().settings = settings
            // [END setup]
            db = Firestore.firestore()
        }
    @IBAction func click(_ sender: Any) {
        addAdaLovelace()

        ref.child("81/caca1/caca2").setValue("\(casillaGuardar.text!)")
        ref.child("82/Cajonera 1/Generador/Estado").observeSingleEvent(of: .value) { (datoEstado) in
            
            if datoEstado.value as? Bool == false{
                self.labelGuardar.textColor = UIColor.red
            }else {
                self.labelGuardar.textColor = UIColor.green
            
            }
            

        }
        // Add a new document with a generated ID
       

    }
    private func addAdaLovelace() {
        // [START add_ada_lovelace]
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        ref = db.collection("users").addDocument(data: [
            "first": "Ada",
            "last": "Lovelace",
            "born": 1815
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
        // [END add_ada_lovelace]
    }
    


}

