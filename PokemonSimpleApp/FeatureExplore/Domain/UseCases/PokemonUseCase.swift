//
//  PokemonUseCase.swift
//  PokemonSimpleApp
//
//  Created by Eldar Garbuzov on 15.02.24.
//

import Foundation

// Class for getting the Pokemon list from the repository

class GetPokemonListUseCase {
    let repository: PokemonRepositoryProtocol
    
    init(pokemonRepository: PokemonRepositoryProtocol) {
        self.repository = pokemonRepository
    }
    
    func execute(limit: Int, offset: Int) async throws -> [PokemonEntity] {
        return try await repository.fetchPokemons(limit: limit, offset: offset)
    }
}
