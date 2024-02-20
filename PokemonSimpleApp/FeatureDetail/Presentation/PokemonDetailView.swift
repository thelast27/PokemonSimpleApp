//
//  PokemonDetailView.swift
//  PokemonSimpleApp
//
//  Created by Eldar Garbuzov on 15.02.24.
//

import SwiftUI

struct PokemonDetailView: View {
    
    private let networkMonitor = NetworkMonitor.shared
    var id: Int
    @State private var isAnimating = false
    @State private var pokemonDetail: PokemonDetailEntity?
    
    var body: some View {
        VStack {
            if pokemonDetail == nil && !networkMonitor.isReachable {
                VStack {
                    Text(networkMonitor.isReachable ? "" : "It seems you are offline.. 😢")
                    ProgressView()
                        .progressViewStyle(.circular)
                }
            } else {
                AsyncImage(url: URL(string: pokemonDetail?.pokemon.imageURL ?? "")) { image in
                    image
                        .image?
                        .resizable()
                        .shadow(color: .gray, radius: 10)
                }
                .scaleEffect(isAnimating ? 1.0 : 0.5)
                .onAppear(perform: {
                    withAnimation(.easeInOut(duration: 1)) {
                        isAnimating = true
                    }
                })
                .scaledToFit()
                
                Text(pokemonDetail?.pokemon.name ?? "")
                    .font(.title)
                
                VStack {
                    Text("Type: \(pokemonDetail?.types.first?.type.name ?? "")")
                        .font(.title2)
                    Text("Weight: \((pokemonDetail?.weight ?? 0) / 10) kg")
                        .font(.title2)
                    Text("Height: \((pokemonDetail?.height ?? 0) * 10) cm")
                        .font(.title2)
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
