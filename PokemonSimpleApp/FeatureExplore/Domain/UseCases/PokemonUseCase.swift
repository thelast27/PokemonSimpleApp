//
//  PokemonUseCase.swift
//  PokemonSimpleApp
//
//  Created by Eldar Garbuzov on 15.02.24.
//

import Foundation
import CoreData

// Class for getting the Pokemon list from the repository

class GetPokemonListUseCase {
    let repository: PokemonRepositoryProtocol
    
    init(pokemonRepository: PokemonRepositoryProtocol) {
        self.repository = pokemonRepository
    }
    
    func execute(context: NSManagedObjectContext, limit: Int, offset: Int) async throws -> [PokemonEntity] {
        return try await repository.fetchPokemons(context: context, limit: limit, offset: offset)
    }
}
