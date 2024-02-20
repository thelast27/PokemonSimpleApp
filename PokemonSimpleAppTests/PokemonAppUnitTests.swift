//
//  PokemonAppUnitTests.swift
//  PokemonSimpleAppTests
//
//  Created by Eldar Garbuzov on 19.02.24.
//

import XCTest
import SwiftUI
@testable import PokemonSimpleApp

class PokemonAppUnitTests: XCTestCase {
    
    var cd: CoreDataManager?
    var getPokemonListUseCase: GetPokemonListUseCase?
    
    @Environment(\.managedObjectContext) var context
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        cd = CoreDataManager()
        getPokemonListUseCase = GetPokemonListUseCase(pokemonRepository: ExploreRepository.shared)
    }
    
    override func tearDownWithError() throws {
        cd = nil
        getPokemonListUseCase = nil
        try super.tearDownWithError()
    }
    
    func testCoreData() throws {
        let storeCount = cd?.container.viewContext.persistentStoreCoordinator?.persistentStores.count
        XCTAssertEqual(storeCount, 1, "check for storing data in Core Data")
    }
    
    func testGetPokemonList() throws {
        let limit = 20
        let offset = 0
        Task {
            guard let getPokemonList = try await getPokemonListUseCase?.repository.fetchPokemons(context: context, limit: limit, offset: offset) else { return }
            XCTAssert(!getPokemonList.isEmpty, "pokemon fetch existence check")
        }
    }
    
    func testPokemonCount() throws {
        let limit = 20
        let offset = 0
        Task {
            guard let pokemonCount = try await getPokemonListUseCase?.repository.fetchPokemons(context: context, limit: limit, offset: offset) else { return }
            XCTAssertEqual(pokemonCount.count, limit, "limit pokemon list request excess")
        }
    }
}
