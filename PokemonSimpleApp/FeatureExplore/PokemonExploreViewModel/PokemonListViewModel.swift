//
//  PokemonListViewModel.swift
//  PokemonSimpleApp
//
//  Created by Eldar Garbuzov on 21.02.24.
//

import SwiftUI

class PokemonListViewModel: ObservableObject {
    
    let limit: Int = 20
    let getPokemonListUseCase: GetPokemonListUseCase = GetPokemonListUseCase(pokemonRepository: ExploreRepository.shared)
    
    @Published private var offset: Int = 0
    @Published var pokemonList: [PokemonEntity] = []
    @Environment(\.managedObjectContext) var context
    
    func loadMore() async throws {
        Task {
            do {
                let newPokemonList = try await getPokemonListUseCase.execute(context: context, limit: limit, offset: offset)
                DispatchQueue.main.async {
                    self.pokemonList += newPokemonList
                    self.offset += newPokemonList.count
                }
            } catch {
                print("Error occurred: \(error)")
            }
        }
    }
}
