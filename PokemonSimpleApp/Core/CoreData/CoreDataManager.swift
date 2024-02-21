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
        ValueTransformer.setValueTransformer(UIImageTransformer(), forName: NSValueTransformerName("UIImageTransformer"))
        container.loadPersistentStores { _, _ in }
    }
    
    func saveData(context: NSManagedObjectContext, name: String, url: String) {
        
        let entity = Pokemon(context: context)
        entity.name = name
        entity.url = url
        NetworkManager().downloadImage(from: url) { image in
            entity.image = UIImage(data: image)
        }
        
        
        do {
            try context.save()
            print("SUCCESS CORE DATA")
        } catch {
            print(error.localizedDescription)
        }
    }
}
