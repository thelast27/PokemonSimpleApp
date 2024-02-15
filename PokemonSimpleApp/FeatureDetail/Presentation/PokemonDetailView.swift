//
//  PokemonDetailView.swift
//  PokemonSimpleApp
//
//  Created by Eldar Garbuzov on 15.02.24.
//

import SwiftUI

struct PokemonDetailView: View {
    var id: Int
    @State private var pokemonDetail: PokemonDetailEntity?
    
    var body: some View {
        VStack {
            if pokemonDetail == nil {
                Text("Loading...")
            } else {
                AsyncImage(url: URL(string: pokemonDetail?.pokemon.imageURL ?? "")) { image in
                    image
                        .image?
                        .resizable()
                }
                .scaledToFit()
                
                Text(pokemonDetail?.pokemon.name ?? "")
                    .font(.title)
                
                VStack {
                    Text("Height: \((pokemonDetail?.height ?? 0) * 10) cm")
                        .font(.subheadline)
                    Text("Weight: \((pokemonDetail?.weight ?? 0) / 10) kg")
                        .font(.subheadline)
                    Text("Type: \(pokemonDetail?.types.first?.type.name ?? "")")
                        .font(.subheadline)
                }
            }
        }
        .task {
            loadDetail(id: id)
        }
    }
    
    func loadDetail(id: Int) {
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

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(id: 1)
    }
}
