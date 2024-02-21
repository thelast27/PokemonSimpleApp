//
//  PokemonRepository.swift
//  PokemonSimpleApp
//
//  Created by Eldar Garbuzov on 15.02.24.
//

import Foundation
import CoreData

class ExploreRepository: PokemonRepositoryProtocol {
    
    private let exploreDataSource = ExploreDataSource()
    
    func fetchPokemons(context: NSManagedObjectContext, limit: Int, offset: Int) async throws -> [PokemonEntity] {
        let pokemonsListResponse: PokemonListModel = try await exploreDataSource.fetchPokemons(context: context, limit: limit, offset: offset)
        let pokemonResponses: [PokemonModel] = pokemonsListResponse.results
        let pokemonEntities: [PokemonEntity] = pokemonResponses.compactMap { pokemon in
            let pokemonImageURL = PokemonEntity(pokemonResponse: pokemon)?.imageURL
            CoreDataManager().saveData(context: context, name: pokemon.name, url: pokemonImageURL ?? "")
            return PokemonEntity(pokemonResponse: pokemon)
        }
        
        return pokemonEntities
    }
}
