//
//  SwiftUI_CoreData_WithEaseApp.swift
//  Shared
//
//  Created by Andy Nadal on 5/13/21.
//

import SwiftUI

@main
struct SwiftUI_CoreData_WithEaseApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
