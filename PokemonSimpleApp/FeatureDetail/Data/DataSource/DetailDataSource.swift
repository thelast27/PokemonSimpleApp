//
//  DetailDataSource.swift
//  PokemonSimpleApp
//
//  Created by Eldar Garbuzov on 15.02.24.
//

import Foundation

class DetailDataSource {
    func fetchPokemonDetail(id: Int) async throws -> PokemonDetailModel {
        guard let url: URL = Constants.APIEndpoint.getPokemonDetails(id: id).url else {
            throw URLError(.badURL)
        }
        
        return try await NetworkUtils.shared.fetch(from: url)
    }
}
