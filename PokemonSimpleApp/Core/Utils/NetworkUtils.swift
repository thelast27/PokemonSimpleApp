//
//  NetworkUtils.swift
//  PokemonSimpleApp
//
//  Created by Eldar Garbuzov on 15.02.24.
//

import Foundation

class NetworkUtils {
    
    static let shared = NetworkUtils()
    
    func fetch<T: Codable>(from url: URL) async throws -> T {
        var request = URLRequest(url: url)
        request.timeoutInterval = Constants.pokeApiTimeoutInterval
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }
        
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        
        return decodedData
    }
}
