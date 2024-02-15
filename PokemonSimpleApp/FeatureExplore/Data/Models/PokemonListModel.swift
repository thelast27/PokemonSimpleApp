//
//  PokemonListModel.swift
//  PokemonSimpleApp
//
//  Created by Eldar Garbuzov on 15.02.24.
//

import Foundation

struct PokemonListModel: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [PokemonModel]
}
