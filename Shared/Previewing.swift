//
//  Previewing.swift
//  SwiftUI-CoreData-WithEase
//
//  Created by Andy Nadal on 5/14/21.
//

import CoreData
import SwiftUI

struct Previewing<Content: View, Model>: View {
    var content: Content
    var persistence: PersistenceController

    /// Initializer that provides the instance of `model`
    init(_ keyPath: KeyPath<PreviewingData, (NSManagedObjectContext) -> Model>, @ViewBuilder content: (Model) -> Content) {

        self.persistence = PersistenceController(inMemory: true)
        let data = PreviewingData()
        let closure = data[keyPath: keyPath]
        let models = closure(persistence.container.viewContext)

        self.content = content(models)
    }

    /// Initializer that provides a context with an instance of `model`
    init(contextWith keyPath: KeyPath<PreviewingData, (NSManagedObjectContext) -> Model>, @ViewBuilder content: () -> Content) {

        self.persistence = PersistenceController(inMemory: true)
        let data = PreviewingData()
        let closure = data[keyPath: keyPath]

        // Ignore closure return, we just care about creating the data
        _ = closure(persistence.container.viewContext)

        self.content = content()
    }

    var body: some View {
        content
            .environment(\.managedObjectContext, persistence.container.viewContext)
    }
}

struct PreviewingData {
    var items: (NSManagedObjectContext) -> [Item] { { context in
        var createdItems = [Item]()
        for _ in 0..<15 {
            let newItem = Item(context: context)
            newItem.timestamp = Date()
            createdItems.append(newItem)
        }
        return createdItems
    } }

    var item: (NSManagedObjectContext) -> Item { { context in
        let newItem = Item(context: context)
        newItem.timestamp = Date()
        return newItem
    } }
}

