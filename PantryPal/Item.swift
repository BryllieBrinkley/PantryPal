//
//  Item.swift
//  PantryPal
//
//  Created by Jibryll Brinkley on 3/31/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var title: String
    var isCompleted: Bool
    
    init(title: String, isCompleted: Bool) {
        self.title = title
        self.isCompleted = isCompleted
    }
}
