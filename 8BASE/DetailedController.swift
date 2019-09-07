//
//  DetailedController.swift
//  8BASE
//
//  Created by Carlos Leniz on 9/3/19.
//  Copyright © 2019 Carlos Leniz. All rights reserved.
//

//
//  CheckController.swift
//  8BASE
//
//  Created by Carlos Leniz on 8/16/19.
//  Copyright © 2019 Carlos Leniz. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase

struct elemento {
    let nCajonera : String!
    let nUnidad : String!
    let nElemento : String!
    let cantidad : Int!
    let marca : String!
    let modelo : String!
    let observaciones : String!
}

class DetailedController: UIViewController {
    
    var i = 0
    
    @IBOutlet weak var cajonera: UILabel!
    @IBOutlet weak var unidad: UILabel!
    @IBOutlet weak var nElemento: UILabel! //Nombre Elemento
    @IBOutlet weak var cantidad: UILabel! //Cantidad Elemento
    @IBOutlet weak var marca: UILabel!
    @IBOutlet weak var modelo: UILabel!
    @IBOutlet weak var observaciones: UILabel!
    
    @IBAction func continuarBtn(_ sender: Any) {
        i=i+1 //sumar al contador para que lea el siguiente elemento
        readDatabase()
    }
    @IBAction func incorrectoBtn(_ sender: Any) {
        //Se debe cambiar el "ESTADO" del elemento a "malo"
    }
    
    
    //let elementos = [elemento]

    override func viewDidLoad() {
        super.viewDidLoad()
        readDatabase()
    }
    
    func readDatabase(){
    //https://stackoverflow.com/questions/37759614/firebase-retrieving-data-in-swift
        let ref = Database.database().reference().child("UNIDAD 83").child("0 Cabina")
        ref.observeSingleEvent(of: .value, with: { snapshot in
            
            if !snapshot.exists() { return }
            //print("Aaa: ",snapshot) ==> Imprime todo (incluyendo key)
            //print("Bbb: ",snapshot.value!) ==>Imprime todo desde el key para abajo
            //print(snapshot.childSnapshot(forPath: "[PATH]").value) ==> Imprime un valor especifico
            
            //Nombre elemento
            var a = String(self.i)
            a += "/NOMBRE"
            let nombre = snapshot.childSnapshot(forPath: a).value
            self.nElemento.text = nombre! as? String
            self.view.addSubview(self.nElemento)
            
            //Cantidad
            var b = String(self.i)
            b += "/CANTIDAD"
            let cantidad = snapshot.childSnapshot(forPath: b).value
            self.cantidad.text = cantidad! as? String
            self.view.addSubview(self.cantidad)
            
            //Marca
            var c = String(self.i)
            c += "/MARCA"
            let marca = snapshot.childSnapshot(forPath: c).value
            self.marca.text = marca! as? String
            self.view.addSubview(self.marca)
            
            //Modelo
            var d = String(self.i)
            d += "/MODELO"
            let modelo = snapshot.childSnapshot(forPath: d).value
            self.modelo.text = modelo! as? String
            self.view.addSubview(self.modelo)
            
            //Observacion
            var e = String(self.i)
            e += "/OBSERVACIoN"
            let observaciones = snapshot.childSnapshot(forPath: e).value
            self.observaciones.text = observaciones! as? String
            self.view.addSubview(self.observaciones)
            
        })
    }
}

//Cambiar texto
/*
 nElemento.text(value)
 self.view.addSubview(self.nElemento)
 */
