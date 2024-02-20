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
    let limit: Int = 20
    private let networkMonitor = NetworkMonitor.shared
    
    @State private var pokemonList: [PokemonEntity] = []
    @State private var offset: Int = 0
    
    @Environment(\.managedObjectContext) var context
    @FetchRequest(sortDescriptors: []) private var results: FetchedResults<Pokemon>
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    if results.isEmpty || !results.isEmpty && !pokemonList.isEmpty {
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
                    } else if !results.isEmpty && pokemonList.isEmpty {
                        ForEach(results) { pokemon in
                            PokemonListView(pokemonCache: pokemon)
                        }
                    }
                }
                .navigationTitle("Explore Pokemons 🐉")

                Text(networkMonitor.isReachable ? "" : "It seems you are offline.. 😢")
            }
        }
        .task {
            loadMore()
        }
    }
    
    private func loadMore() {
        Task {
            do {
                let newPokemonList = try await getPokemonListUseCase.execute(context: context, limit: limit, offset: offset)
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
