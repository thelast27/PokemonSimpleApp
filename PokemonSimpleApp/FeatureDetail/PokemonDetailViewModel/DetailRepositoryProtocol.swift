//
//  DetailRepositoryProtocol.swift
//  PokemonSimpleApp
//
//  Created by Eldar Garbuzov on 15.02.24.
//

import Foundation

protocol DetailRepositoryProtocol {
    func fetchPokemonDetail(id: Int) async throws -> PokemonDetailEntity?
}
