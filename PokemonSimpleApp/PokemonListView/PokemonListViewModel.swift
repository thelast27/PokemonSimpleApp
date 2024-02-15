//
//  PokemonListViewModel.swift
//  PokemonSimpleApp
//
//  Created by Eldar Garbuzov on 15.02.24.
//

import Foundation

class PokemonListViewModel: ObservableObject {
    
    @Published var pokemons: [PokemonModel] = []
    

    
    func getPokemons() {
       let pokemon = PokemonModel(name: "Bulbasaur")
        for i in 1...30 {
            pokemons.append(pokemon)
        }
    }
}
