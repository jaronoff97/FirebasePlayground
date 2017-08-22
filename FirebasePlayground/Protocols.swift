//
//  Protocols.swift
//  FirebasePlayground
//
//  Created by Jacob Aronoff on 8/22/17.
//  Copyright © 2017 Jacob Aronoff. All rights reserved.
//

import Foundation
import FirebaseDatabase

protocol FirebaseItem {
    var id: String { get set }
    var name: String { get set }
    func toJSON() -> [String: Any]
    init(fromFirebaseItem item: FIRDataSnapshot)
}
protocol FirebaseTableDelegate {
    func reloadData()
}
