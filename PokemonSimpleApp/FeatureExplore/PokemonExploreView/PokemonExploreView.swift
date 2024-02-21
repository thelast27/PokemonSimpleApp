//
//  PokemonExploreView.swift
//  PokemonSimpleApp
//
//  Created by Eldar Garbuzov on 15.02.24.
//

import Foundation
import SwiftUI

struct PokemonExploreView: View {
    
    @StateObject var vm = PokemonListViewModel()
    private let networkMonitor = NetworkMonitor.shared
    @FetchRequest(sortDescriptors: []) private var results: FetchedResults<Pokemon>
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    //                    if results.isEmpty || !results.isEmpty && !vm.pokemonList.isEmpty {
                    ForEach(vm.pokemonList, id: \.self) { pokemon in
                        NavigationLink(destination: PokemonDetailView(id: pokemon.id)) {
                            PokemonListView(pokemon: pokemon)
                                .task {
                                    do {
                                        if vm.pokemonList.last == pokemon {
                                            try await vm.loadMore()
                                        }
                                        
                                    } catch {
                                        print("get pokeon list error")
                                    }
                                }
                        }
                    }
                    //                    }
                }
                .navigationTitle("Explore Pokemons 🐉")
                
                Text(networkMonitor.isReachable ? "" : "It seems you are offline.. 😢")
            }
        }
        .task {
            do {
                try await vm.loadMore()
            } catch {
                print("get pokeon list error")
            }
        }
    }
}

struct PokemonExploreView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonExploreView()
    }
}
