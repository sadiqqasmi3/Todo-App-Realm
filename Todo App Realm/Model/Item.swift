//
//  Item.swift
//  Todo App Realm
//
//  Created by sadiq qasmi on 24/02/2021.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title :String = ""
    @objc dynamic var done : Bool = false
    //var parentCatagory = LinkingObjects(fromType: Category.self ,property:"items" )
} 
