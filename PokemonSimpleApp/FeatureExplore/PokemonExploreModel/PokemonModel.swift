//
//  PokemonModel.swift
//  PokemonSimpleApp
//
//  Created by Eldar Garbuzov on 15.02.24.
//

import Foundation

struct PokemonModel: Decodable, Encodable {
    let name: String
    let url: String
}
