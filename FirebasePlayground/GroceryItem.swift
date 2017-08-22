//
//  GroceryItem.swift
//  FirebasePlayground
//
//  Created by Jacob Aronoff on 8/22/17.
//  Copyright © 2017 Jacob Aronoff. All rights reserved.
//

import Foundation
import FirebaseDatabase


struct GroceryItem: FirebaseItem {
    var id: String
    var name: String
    var price: Double
    
    init(fromFirebaseItem item: FIRDataSnapshot) {
        let properties = item.value as? NSDictionary
        self.id = properties?.value(forKey: "id") as! String
        self.name = properties?.value(forKey: "name") as! String
        self.price = properties?.value(forKey: "price") as! Double
    }
    
    init(id: String, name: String, price: Double) {
        self.id = id
        self.name = name
        self.price = price
    }
    
    func toJSON() -> [String: Any] {
        return [
            "id":self.id,
            "name":self.name,
            "price":self.price
        ]
    }
}
