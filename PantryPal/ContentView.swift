//
//  ContentView.swift
//  PantryPal
//
//  Created by Jibryll Brinkley on 3/31/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    func addEssentialFoods() {
        modelContext.insert(Item(title: "Fruits", isCompleted: false))
        modelContext.insert(Item(title: "Eggs", isCompleted: true))
        modelContext.insert(Item(title: "Cheese", isCompleted: .random()))
        modelContext.insert(Item(title: "Meats", isCompleted: .random()))
        modelContext.insert(Item(title: "Cereals", isCompleted: .random()))
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(items) { item in
                    Text(item.title)
                        .font(.title.weight(.light))
                        .padding(.vertical, 2)
                        .foregroundStyle(item.isCompleted == false ? Color.primary : Color.accentColor)
                        .strikethrough(item.isCompleted)
                        .italic(item.isCompleted)
                        .swipeActions {
                            Button(role: .destructive) {
                                withAnimation {
                                    modelContext.delete(item)
                                }
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                        .swipeActions(edge: .leading) {
                            Button("Done", systemImage: item.isCompleted == false ? "checkmark.circle" : "x.circle") {
                                item.isCompleted.toggle()
                            }
                            .tint(item.isCompleted == false ? .green : .accentColor)
                        }
                }
            }
            .navigationTitle("Grocery List")
            .toolbar {
                if items.isEmpty {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            addEssentialFoods()
                        } label: {
                            Label("Essentials", systemImage: "carrot")
                        }
                    }
                }
            }
            .overlay {
                if items.isEmpty {
                    ContentUnavailableView("Empty Cart", systemImage: "cart.circle", description: Text("Add some items to the shopping list"))
                }
            }
        }
    }
}

#Preview("List with Sample Data") {
    let sampleData: [Item] = [
        Item(title: "Fruits", isCompleted: false),
        Item(title: "Eggs", isCompleted: true),
        Item(title: "Cheese", isCompleted: .random()),
        Item(title: "Meats", isCompleted: .random()),
        Item(title: "Cereals", isCompleted: .random())
    ]
    
    let container = try! ModelContainer(for: Item.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    
    for item in sampleData {
        container.mainContext.insert(item)
    }
    
    return ContentView()
        .modelContainer(container)
    
}

#Preview("Empty List") {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
