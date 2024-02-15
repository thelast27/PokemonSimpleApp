//
//  PokemonExploreView.swift
//  PokemonSimpleApp
//
//  Created by Eldar Garbuzov on 15.02.24.
//

import Foundation

import SwiftUI

struct PokemonExploreView: View {
    let getPokemonListUseCase: GetPokemonListUseCase = GetPokemonListUseCase(pokemonRepository: ExploreRepository.shared)
    
    @State private var pokemonList: [PokemonEntity] = []
    @State private var offset: Int = 0
    let limit: Int = 20
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(pokemonList, id: \.self) { pokemon in
                    NavigationLink(destination: PokemonDetailView(id: pokemon.id)) {
                        PokemonListView(pokemon: pokemon)
                            .onAppear(perform: {
                                if pokemonList.last == pokemon {
                                    loadMore()
                                }
                            })
                    }
                }
            }
        }
        .task {
            loadMore()
        }
    }
    
    private func loadMore() {
        Task {
            do {
                let newPokemonList = try await getPokemonListUseCase.execute(limit: limit, offset: offset)
                pokemonList += newPokemonList
                
                offset += newPokemonList.count
            } catch {
                print("Error occurred: \(error)")
            }
        }
    }
}

struct PokemonExploreView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonExploreView()
    }
}

