//
//  PokemonDetailViewModel.swift
//  PokemonSimpleApp
//
//  Created by Eldar Garbuzov on 21.02.24.
//

import SwiftUI

class PokemonDetailViewModel: ObservableObject {
    
    @Published var pokemonDetail: PokemonDetailEntity?
    
    @MainActor
    func loadDetail(id: Int) async throws {
        Task {
            do {
                let getPokemonDetailUseCase = GetPokemonDetailUseCase(repository: DetailRepository.shared)
                
                self.pokemonDetail = try await getPokemonDetailUseCase.execute(id: id)
            } catch {
                print("Error: \(error)")
            }
        }
    }
}
