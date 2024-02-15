//
//  DetailRepository.swift
//  PokemonSimpleApp
//
//  Created by Eldar Garbuzov on 15.02.24.
//

import Foundation

class DetailRepository: DetailRepositoryProtocol {
    static let shared = DetailRepository()
    
    private let detailDataSource = DetailDataSource()
    
    func fetchPokemonDetail(id: Int) async throws -> PokemonDetailEntity? {
        let pokemonDetailResponse: PokemonDetailModel = try await detailDataSource.fetchPokemonDetail(id: id)
        
        guard let pokemonDetail: PokemonDetailEntity = PokemonDetailEntity(pokemonDetailResponse: pokemonDetailResponse) else {
            return nil
        }
        
        return pokemonDetail
    }
}
