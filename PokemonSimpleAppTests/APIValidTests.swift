//
//  PokemonSimpleAppTests.swift
//  PokemonSimpleAppTests
//
//  Created by Eldar Garbuzov on 14.02.24.
//

import XCTest
@testable import PokemonSimpleApp

final class PokemonSimpleAppTests: XCTestCase {
    
    private let urlSession = URLSession(configuration: .default)
    private let networkMonitor = NetworkMonitor()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
    }
    
    override func tearDownWithError() throws {
        
        try super.tearDownWithError()
    }
    //MARK: - tests
    func testValidApiCallCode200PokemonImage() throws  {
        
        let url = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/12.png"
        
        try XCTSkipUnless(
            networkMonitor.isConnected,
            "Network connection needed for this test.")
        
        guard let url = URL(string: url) else { return }
        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?
        
        let dataTask = urlSession.dataTask(with: url) { _, response, error in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            promise.fulfill()
        }
        dataTask.resume()
        wait(for: [promise], timeout: 5)
        
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200, "check accert code200 for Get pokemon image url")
    }
    
    func testValidApiCallCode200PokemonList() throws {

        let limit: Int = 20
        let offset: Int = 0
        let url = "https://pokeapi.co/api/v2/pokemon?limit=\(limit)&offset=\(offset)"
        
        try XCTSkipUnless(
            networkMonitor.isConnected,
            "Network connection needed for this test.")

        guard let url = URL(string: url) else { return }
        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?
        
        let dataTask = urlSession.dataTask(with: url) { _, response, error in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            promise.fulfill()
        }
        dataTask.resume()
        wait(for: [promise], timeout: 5)
        
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200, "check accert code200 for Get pokemon list url")
    }
}
