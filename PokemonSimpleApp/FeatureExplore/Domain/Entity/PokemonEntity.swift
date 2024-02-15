//
//  PokemonEntity.swift
//  PokemonSimpleApp
//
//  Created by Eldar Garbuzov on 15.02.24.
//

import Foundation

struct PokemonEntity: Hashable {
    let id: Int
    let name: String
    var imageURL: String
    
    init?(pokemonResponse: PokemonModel) {
        guard let urlComponents = URLComponents(string: pokemonResponse.url),
              let idString = urlComponents.path.split(separator: "/").last,
              let id = Int(idString) else {
            return nil
        }
        
        self.id = id
        self.name = pokemonResponse.name
        self.imageURL = Constants.APIEndpoint.getPokemonImage(id: id).url?.absoluteString ?? ""
    }
    
    init?(pokemonDetailResponse: PokemonDetailModel) {
        self.id = pokemonDetailResponse.id
        self.name = pokemonDetailResponse.name
        self.imageURL = Constants.APIEndpoint.getPokemonImage(id: id).url?.absoluteString ?? ""
    }
}
