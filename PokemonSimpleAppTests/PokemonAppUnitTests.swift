//
//  PokemonAppUnitTests.swift
//  PokemonSimpleAppTests
//
//  Created by Eldar Garbuzov on 19.02.24.
//

import XCTest
import CoreData
@testable import PokemonSimpleApp

class PokemonAppUnitTests: XCTestCase {
    
    private let limit = 20
    private let offset = 0
    private let id = 12
    
    private var coreDataManager: CoreDataManager?
    private var context: NSManagedObjectContext?
    private var container: NSPersistentContainer?
    private var getPokemonList: GetPokemonListUseCase?
    private var getPokemonDetail: GetPokemonDetailUseCase?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        coreDataManager = CoreDataManager()
        container = NSPersistentContainer(name: "CoreJSON")
        context = container?.viewContext
        getPokemonList = GetPokemonListUseCase(pokemonRepository: ExploreRepository.shared)
        getPokemonDetail = GetPokemonDetailUseCase(repository: DetailRepository.shared)
    }
    
    override func tearDownWithError() throws {
        coreDataManager = nil
        getPokemonList = nil
        getPokemonDetail = nil
        container = nil
        context = nil
        try super.tearDownWithError()
    }
    
    //MARK: - tests
    
    func testCoreData() throws {
        let storeCount = coreDataManager?.container.viewContext.persistentStoreCoordinator?.persistentStores.count
        XCTAssertEqual(storeCount, 1, "check for storing data in Core Data")
    }
    
    func testGetPokemonList() async throws {
        guard let context = context,
              let newPokemonList = try? await getPokemonList?.execute(context: context, limit: limit, offset: offset) else { return }
        var pokemonList: [PokemonEntity] = []
        
        pokemonList += newPokemonList
        
        XCTAssertEqual(pokemonList.count, 20, "limit pokemon list request excess")
        XCTAssertFalse(pokemonList.isEmpty, "pokemon fetch existence check")
    }
    
    func testGetPokemonDetail() async throws {
        let name = "butterfree"
        let height = 11
        let weight = 320
        let type = "bug"
        let getPokemonDetailUseCase = GetPokemonDetailUseCase(repository: DetailRepository.shared)
        var pokemonDetail: PokemonDetailEntity?
        
        pokemonDetail = try await getPokemonDetailUseCase.execute(id: id)
        
        XCTAssertNotNil(pokemonDetail, "pokemon detail must not be nil")
        XCTAssertEqual(pokemonDetail?.pokemon.name, name, "check pokemon detailed name")
        XCTAssertEqual(pokemonDetail?.height, height, "check pokemon detailed height")
        XCTAssertEqual(pokemonDetail?.weight, weight, "check pokemon detailed weight")
        XCTAssertEqual(pokemonDetail?.types.first?.type.name, type, "check pokemon detailed type")
    }
}
