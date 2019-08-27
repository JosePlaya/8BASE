//
//  Monster.swift
//  8BASE
//
//  Created by Carlos Leniz on 8/9/19.
//  Copyright © 2019 Carlos Leniz. All rights reserved.
//

import Foundation
import UIKit


class Monster {
    let name: String
    let description: String
    let iconName: String
    
    init(name: String, description: String, iconName: String) {
        self.name = name
        self.description = description
        self.iconName = iconName

    }
    

    
    
    var icon: UIImage? {
        return UIImage(named: iconName)
    }
}
