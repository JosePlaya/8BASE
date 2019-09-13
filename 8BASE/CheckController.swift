//
//  CheckController.swift
//  8BASE
//
//  Created by Carlos Leniz on 8/16/19.
//  Copyright © 2019 Carlos Leniz. All rights reserved.
//

import Foundation
import UIKit

//https://www.youtube.com/watch?v=cJUmrdfgbbA

class UITableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let unidadesArray = ["UNIDAD 81", "UNIDAD 82", "UNIDAD 83"]
    let cajonerasU81Array = ["Cabina","Cajonera 1", "Cajonera 2", "Cajonera 3", "Cajonera 4", "Otros"]
    let cajonerasU82Array = ["Cabina","Cajonera 1", "Cajonera 2", "Cajonera 3", "Cajonera 4", "Cajonera 5", "Cajonera 6", "Otros"]
    let cajonerasU83Array = ["Cabina","Cajonera 1", "Cajonera 2", "Cajonera 3", "Cajonera 4", "Cajonera 5", "Cajonera 6", "Cajonera 7",  "Cajonera 8",  "Cajonera 9", "Cajonera 10", "Cajonera 11", "Cajonera 12", "Cajonera 13", "Cajonera 14", "Otros"]
   

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return unidadesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel!.text = unidadesArray[indexPath.row]
        return cell
    }
    
    
}
