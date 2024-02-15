//
//  ContentView.swift
//  PokemonSimpleApp
//
//  Created by Eldar Garbuzov on 14.02.24.
//

import SwiftUI

struct PokemonListView: View {
    var pokemon: PokemonEntity

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: pokemon.imageURL)) { image in
                image
                    .image?
                    .resizable()
                    .shadow(color: .green, radius: 5)
            }
            .scaledToFit()
            .frame(width: 100, height: 70)

            Text(pokemon.name)
                .font(.title2)
        }
    }
}
