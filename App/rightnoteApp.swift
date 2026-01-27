//
//  rightnoteApp.swift
//  rightnote
//
//  Created by Deepak Gawade on 07/01/26.
//

import SwiftUI
import SwiftData

@main
struct rightnoteApp: App {
    // code for initializing swiftData(sqlite)
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,Note.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

//    var body: some Scene {
//        WindowGroup {
//            ContentView(modelContext:sharedModelContainer.mainContext)
//        }
//        .modelContainer(sharedModelContainer)
//    }
    
    var body: some Scene {
        WindowGroup {
    PostsView()
        }
        //.modelContainer(sharedModelContainer)
    }
}
