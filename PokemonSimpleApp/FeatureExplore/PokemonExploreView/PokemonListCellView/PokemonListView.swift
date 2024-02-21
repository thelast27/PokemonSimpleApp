//
//  ContentView.swift
//  PokemonSimpleApp
//
//  Created by Eldar Garbuzov on 14.02.24.
//

import SwiftUI

struct PokemonListView: View {
    var pokemon: PokemonEntity?
    var pokemonCache: Pokemon?

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: pokemon == nil ? pokemonCache?.url ?? "" : pokemon?.imageURL ?? "")) { image in
                image
                    .image?
                    .resizable()
                    .shadow(color: .gray, radius: 5)
            }
            .scaledToFit()
            .frame(width: 100, height: 70)

            Text((pokemon == nil ? pokemonCache?.name : pokemon?.name) ?? "")
                .font(.title2)
        }
    }
}
