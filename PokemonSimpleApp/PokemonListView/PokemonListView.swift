//
//  ContentView.swift
//  PokemonSimpleApp
//
//  Created by Eldar Garbuzov on 14.02.24.
//

import SwiftUI

struct PokemonListView: View {
    
    @EnvironmentObject var vm: PokemonListViewModel
    @State var isPresented = false
    
    
    var body: some View {
        List {
            ForEach(vm.pokemons) { pokemon in
                PokemonRowView(pokemonModel: pokemon)
                    .sheet(isPresented: $isPresented, content: {
                        PokemonDetailView()
                            .presentationDetents([.fraction(0.2)])
                    })
                    .onTapGesture(perform: {
                        isPresented.toggle()
                    })
            }
        }.onAppear(perform: {
            vm.getPokemons()
        })
    }
}

#Preview {
    NavigationView {
        PokemonListView()
    }
    .environmentObject(PokemonListViewModel())
}
