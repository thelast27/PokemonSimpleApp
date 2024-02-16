//
//  CoreDataManager.swift
//  PokemonSimpleApp
//
//  Created by Eldar Garbuzov on 16.02.24.
//

import CoreData
import SwiftUI

final class CoreDataManager: ObservableObject {
    
    let container: NSPersistentContainer = NSPersistentContainer(name: "CoreJSON")
    
    init() {
        container.loadPersistentStores { _, _ in }
    }
    
    func saveData(context: NSManagedObjectContext, name: String, url: String) {
        let entity = Pokemon(context: context)
        entity.name = name
        entity.url = url
        
        do {
            try context.save()
            print("SUCCESS CORE DATA")
        } catch {
            print(error.localizedDescription)
        }
    }
}
