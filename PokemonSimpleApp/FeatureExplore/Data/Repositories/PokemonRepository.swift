//
//  PokemonRepository.swift
//  PokemonSimpleApp
//
//  Created by Eldar Garbuzov on 15.02.24.
//

import Foundation

//data repository

class ExploreRepository: PokemonRepositoryProtocol {
    static let shared = ExploreRepository()
    
    private let exploreDataSource = ExploreDataSource()
    
    func fetchPokemons(limit: Int, offset: Int) async throws -> [PokemonEntity] {
        let pokemonsListResponse: PokemonListModel = try await exploreDataSource.fetchPokemons(limit: limit, offset: offset)
        let pokemonResponses: [PokemonModel] = pokemonsListResponse.results
        let pokemonEntities: [PokemonEntity] = pokemonResponses.compactMap { pokemon in
            return PokemonEntity(pokemonResponse: pokemon)
        }
        
        return pokemonEntities
    }
}
