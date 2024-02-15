//
//  PokemonModel.swift
//  PokemonSimpleApp
//
//  Created by Eldar Garbuzov on 15.02.24.
//

import Foundation

struct PokemonModel: Identifiable {
    
    let id: String
    let name: String
    
    init(id: String = UUID().uuidString, name: String) {
        self.id = id
        self.name = name
    }
    
    func updateCompletion() -> PokemonModel {
        return PokemonModel(id: id, name: name)
    }
}
