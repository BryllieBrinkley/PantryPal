//
//  Tip.swift
//  PantryPal
//
//  Created by Jibryll Brinkley on 3/31/25.
//

import Foundation
import TipKit


struct ButtonTip: Tip {
    var title: Text = Text("Essential Foods")
    var message: Text? = Text("Add some everyday items to your shopping list.")
    var image: Image? = Image(systemName: "info.circle")
}
