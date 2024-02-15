//
//  PokemonDetailModel.swift
//  PokemonSimpleApp
//
//  Created by Eldar Garbuzov on 15.02.24.
//

import Foundation

struct PokemonDetailModel: Codable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
}
