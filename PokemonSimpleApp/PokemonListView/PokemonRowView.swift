//
//  PokemonRowView.swift
//  PokemonSimpleApp
//
//  Created by Eldar Garbuzov on 15.02.24.
//

import SwiftUI

struct PokemonRowView: View {
    
    let pokemonModel: PokemonModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PokemonRowView_Previews: PreviewProvider {
    static let pokemonSample = PokemonModel(name: "Pokemon")
    
    static var previews: some View {
        PokemonRowView(pokemonModel: pokemonSample)
    }
}
