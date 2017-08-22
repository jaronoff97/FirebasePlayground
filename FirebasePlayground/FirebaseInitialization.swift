//
//  FirebaseInitialization.swift
//  FirebasePlayground
//
//  Created by Jacob Aronoff on 8/22/17.
//  Copyright © 2017 Jacob Aronoff. All rights reserved.
//

import Foundation
import FirebaseDatabase

class FirebaseInitialization {
    private var childRef: FIRDatabaseReference!
    private var items: [FirebaseItem] = []
    private let delegate: FirebaseTableDelegate
    
    init(delegate: FirebaseTableDelegate) {
        self.delegate = delegate
        let ref = FIRDatabase.database().reference()
        childRef = ref.child("items")
        
        let addFunc = { (data:FIRDataSnapshot) in
            self.items.append(GroceryItem(fromFirebaseItem: data))
            delegate.reloadData()
        }
        let removeFunc = { (data: FIRDataSnapshot) in
            let index = self.items.index(where: { (item) -> Bool in
                let properties = data.value as? NSDictionary
                return item.id == properties!.value(forKey: "id") as! String
            })
            self.items.remove(at: index!)
            delegate.reloadData()
        }
        childRef.observe(FIRDataEventType.childAdded, with: addFunc)
        childRef.observe(FIRDataEventType.childRemoved, with: removeFunc)
    }
    
    func getItems() -> [FirebaseItem] {
        return items
    }
    
    func addItem(item: FirebaseItem) {
        childRef.child(item.id).setValue(item.toJSON())
    }
    
    func removeItem(id: String) {
        childRef.child(id).removeValue()
    }
}
