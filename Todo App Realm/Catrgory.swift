//
//  Catrgory.swift
//  
//
//  Created by sadiq qasmi on 24/02/2021.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name:String = ""
    let items = List<Item>()
    
}
