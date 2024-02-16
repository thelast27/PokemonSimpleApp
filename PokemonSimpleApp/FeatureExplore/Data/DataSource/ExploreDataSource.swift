//
//  ExploreDataSource.swift
//  PokemonSimpleApp
//
//  Created by Eldar Garbuzov on 15.02.24.
//

import Foundation
import CoreData

class ExploreDataSource {
    func fetchPokemons(context: NSManagedObjectContext, limit: Int, offset: Int) async throws -> PokemonListModel {
        guard let url: URL = Constants.APIEndpoint.getPokemonList(limit: limit, offset: offset).url else {
            throw URLError(.badURL)
        }
        
        return try await NetworkUtils.shared.fetch(from: url)
    }
}
