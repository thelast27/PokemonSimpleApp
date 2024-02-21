//
//  Pokemon.swift
//  PokemonSimpleApp
//
//  Created by Eldar Garbuzov on 16.02.24.
//

import Foundation
import CoreData
import UIKit

@objc(Pokemon)
class Pokemon: NSManagedObject {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pokemon> {
        return NSFetchRequest<Pokemon>(entityName: "Pokemon")
    }
    
    @NSManaged public var image: UIImage?
    @NSManaged public var name: String?
    @NSManaged public var url: String?
    
}

extension Pokemon : Identifiable {

}
