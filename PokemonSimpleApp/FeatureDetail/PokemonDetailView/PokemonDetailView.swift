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
    @StateObject var vm = PokemonDetailViewModel()
    
    var body: some View {
        VStack {
            if vm.pokemonDetail == nil && !networkMonitor.isReachable {
                VStack {
                    Text(networkMonitor.isReachable ? "" : "It seems you are offline.. 😢")
                    ProgressView()
                        .progressViewStyle(.circular)
                }
            } else {
                AsyncImage(url: URL(string: vm.pokemonDetail?.pokemon.imageURL ?? "")) { image in
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
                
                Text(vm.pokemonDetail?.pokemon.name ?? "")
                    .font(.title)
                
                VStack {
                    Text("Type: \(vm.pokemonDetail?.types.first?.type.name ?? "")")
                        .font(.title2)
                    Text("Weight: \((vm.pokemonDetail?.weight ?? 0) / 10) kg")
                        .font(.title2)
                    Text("Height: \((vm.pokemonDetail?.height ?? 0) * 10) cm")
                        .font(.title2)
                }
            }
        }
        .task {
            do {
                try await vm.loadDetail(id: id)
            } catch {
                print("get pokeon list error")
            }
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(id: 1)
    }
}
