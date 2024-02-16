//
//  PokemonRepository.swift
//  PokemonSimpleApp
//
//  Created by Eldar Garbuzov on 15.02.24.
//

import Foundation
import CoreData

class ExploreRepository: PokemonRepositoryProtocol {
    static let shared = ExploreRepository()
    
    private let exploreDataSource = ExploreDataSource()
    
    func fetchPokemons(context: NSManagedObjectContext, limit: Int, offset: Int) async throws -> [PokemonEntity] {
        let pokemonsListResponse: PokemonListModel = try await exploreDataSource.fetchPokemons(context: context, limit: limit, offset: offset)
        let pokemonResponses: [PokemonModel] = pokemonsListResponse.results
        let pokemonEntities: [PokemonEntity] = pokemonResponses.compactMap { pokemon in
            CoreDataManager().saveData(context: context, name: pokemon.name, url: pokemon.url)
            return PokemonEntity(pokemonResponse: pokemon)
        }
        
        return pokemonEntities
    }
}
