//
//  PantryPalApp.swift
//  PantryPal
//
//  Created by Jibryll Brinkley on 3/31/25.
//

import SwiftUI
import SwiftData

@main
struct PantryPalApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Item.self)
        }
    }
}
