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
import LocalAuthentication

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
    var Unidad = "UNIDAD 83"
    var Cajonera = "0 Cabina"
    var obs = "Sin observaciones"
    
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
        //Inicia cuadro de dialogo
        self.getError()
    }
    
    @IBAction func retrocederBtn(_ sender: Any) { //NO ESTÁ FUNCIONANDO!!
        i = i - 1 //restar al contador para que lea el elemento anterior
        print(i)
        readDatabase()
    }
    
    //let elementos = [elemento]

    override func viewDidLoad() {
        super.viewDidLoad()
        readDatabase()
    }
    func getError() { //Cuadro de dialogo para verificar que es lo que está mal
        //https://learnappmaking.com/uialertcontroller-alerts-swift-how-to/
        let alert = UIAlertController(title: "¿Qué le pasó", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "No está", style: .default, handler: { action in
            let refR = Database.database().reference().child(self.Unidad).child(self.Cajonera)
            refR.observeSingleEvent(of: .value, with: { snapshot in
                if !snapshot.exists() { return }
                //Obtener nombre elemento
                var a = String(self.i)
                a += "/NOMBRE"
                let nombre = snapshot.childSnapshot(forPath: a).value
                _ = Database.database().reference().child("CHECKLIST").child(self.getDate()).child(self.Unidad).child(self.Cajonera).child(nombre as! String).setValue(["Estado": "REVISAR","Observacion":"No está"])})}))
        alert.addAction(UIAlertAction(title: "Otro", style: .default, handler: { action in
            self.getObservaciones()}))
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    func getObservaciones() { //Cuadro de dialogo para obtener observaciones
        let alert = UIAlertController(title: "Observaciones", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Indique qué está mal..."})
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            if let obs = alert.textFields?.first?.text {
                let refR = Database.database().reference().child(self.Unidad).child(self.Cajonera)
                refR.observeSingleEvent(of: .value, with: { snapshot in
                    if !snapshot.exists() { return }
                    //Obtener nombre elemento
                    var a = String(self.i)
                    a += "/NOMBRE"
                    let nombre = snapshot.childSnapshot(forPath: a).value
                    _ = Database.database().reference().child("CHECKLIST").child(self.getDate()).child(self.Unidad).child(self.Cajonera).child(nombre as! String).setValue(["Estado": "REVISAR","Observacion":obs])})}}))
        self.present(alert, animated: true)
    }
    
    func readDatabase(){
    //https://stackoverflow.com/questions/37759614/firebase-retrieving-data-in-swift
        let ref = Database.database().reference().child(Unidad).child(Cajonera)
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
    
    func getDate() -> String{
        //https://kodigoswift.com/swift-trabajo-con-fechas/
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        let fecha = dateFormatter.string(from: date)
        
        return fecha
    }
}

//Cambiar texto
/*
 nElemento.text(value)
 self.view.addSubview(self.nElemento)
 */
