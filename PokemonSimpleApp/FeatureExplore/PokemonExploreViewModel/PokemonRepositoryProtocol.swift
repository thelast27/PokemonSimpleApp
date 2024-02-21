//
//  PokemonRepositoryProtocol.swift
//  PokemonSimpleApp
//
//  Created by Eldar Garbuzov on 15.02.24.
//

import Foundation
import CoreData

//thanks to this protocol, class will depends on the abstraction

protocol PokemonRepositoryProtocol {
    func fetchPokemons(context: NSManagedObjectContext, limit: Int, offset: Int) async throws -> [PokemonEntity]
}
