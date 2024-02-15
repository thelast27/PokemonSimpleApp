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
        HStack {
            Image("pokemon")
                .shadow(color: .green, radius: 5)
            Text("Bulbasaur")
        }
        .frame(width: 200, height: 50)
    }
}

struct PokemonRowView_Previews: PreviewProvider {
    static let pokemonSample = PokemonModel(name: "Pokemon")
    
    static var previews: some View {
        PokemonRowView(pokemonModel: pokemonSample)
    }
}
