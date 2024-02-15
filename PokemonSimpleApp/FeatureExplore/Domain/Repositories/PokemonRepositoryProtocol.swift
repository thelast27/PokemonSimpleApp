//
//  PokemonRepositoryProtocol.swift
//  PokemonSimpleApp
//
//  Created by Eldar Garbuzov on 15.02.24.
//

import Foundation

//thanks to this protocol, class will depends on the abstraction

protocol PokemonRepositoryProtocol {
    func fetchPokemons(limit: Int, offset: Int) async throws -> [PokemonEntity]
}
