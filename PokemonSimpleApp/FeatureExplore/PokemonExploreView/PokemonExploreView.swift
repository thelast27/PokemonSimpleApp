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
    @State private var networkMonitor = NetworkMonitor()
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
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
                }
                .navigationTitle("Explore Pokemons 🐉")
                
                Text(networkMonitor.isConnected ? "" : "It seems you are offline.. 😢")
                Spacer()
                Text(!vm.animate ? "" : "This is the entire available list. To see more please check your network connection 🛜")
                    .padding(.horizontal)
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
