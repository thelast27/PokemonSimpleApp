//
//  PokemonDetailEntity.swift
//  PokemonSimpleApp
//
//  Created by Eldar Garbuzov on 15.02.24.
//

import Foundation

struct PokemonDetailEntity {
    let pokemon: PokemonEntity
    let height: Int
    let weight: Int
    
    init?(pokemonDetailResponse: PokemonDetailModel) {
        guard let pokemon = PokemonEntity(pokemonDetailResponse: pokemonDetailResponse) else {
            return nil
        }
        
        self.pokemon = pokemon
        self.height = pokemonDetailResponse.height
        self.weight = pokemonDetailResponse.weight
    }
}
