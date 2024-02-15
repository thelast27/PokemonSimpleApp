//
//  ContentView.swift
//  PokemonSimpleApp
//
//  Created by Eldar Garbuzov on 14.02.24.
//

import SwiftUI

struct PokemonListView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    PokemonListView()
}
