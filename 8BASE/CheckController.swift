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
    let elementosArray = ["kjhbkj,1", "2o.kjb,hk.l", "3jvghcnhmvj,"]
   

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elementosArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel!.text = elementosArray[indexPath.row]
        return cell
    }
    
    
}
