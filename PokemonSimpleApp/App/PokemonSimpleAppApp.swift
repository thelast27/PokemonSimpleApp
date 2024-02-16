//
//  PokemonSimpleAppApp.swift
//  PokemonSimpleApp
//
//  Created by Eldar Garbuzov on 14.02.24.
//

import SwiftUI

@main
struct PokemonSimpleAppApp: App {
    
    @StateObject private var manager: CoreDataManager = CoreDataManager()
    
    var body: some Scene {
        WindowGroup {
            PokemonExploreView()
                .environmentObject(manager)
                .environment(\.managedObjectContext, manager.container.viewContext)
        }
    }
}
