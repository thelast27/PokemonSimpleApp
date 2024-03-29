//
//  Constants.swift
//  PokemonSimpleApp
//
//  Created by Eldar Garbuzov on 15.02.24.
//

import Foundation

struct PokemonService {
    static let pokeApiURL: String = "https://pokeapi.co/api/v2/"
    static let pokeApiArtworkURL: String = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/%d.png"
    static let pokeApiTimeoutInterval: Double = 15.0

    static let pokeApiPokemonListlimit: Int = 20
    
    enum APIEndpoint {
        case getPokemonList(limit: Int, offset: Int)
        case getPokemonImage(id: Int)
        case getPokemonDetails(id: Int)
        case getPokemonElements(id: Int)
        var url: URL? {
            switch self {
            case .getPokemonList(let limit, let offset):
                return URL(string: "\(pokeApiURL)pokemon?limit=\(limit)&offset=\(offset)")
            case .getPokemonImage(let id):
                return URL(string: String(format: pokeApiArtworkURL, id))
            case .getPokemonDetails(let id):
                return URL(string: "\(pokeApiURL)pokemon/\(id)/")
            case .getPokemonElements(let id):
                return URL(string: "\(pokeApiURL)pokemon/\(id)/")
            }
        }
    }
}
