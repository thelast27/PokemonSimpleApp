//
//  PokemonSimpleAppTests.swift
//  PokemonSimpleAppTests
//
//  Created by Eldar Garbuzov on 14.02.24.
//

import XCTest
@testable import PokemonSimpleApp

final class PokemonSimpleAppTests: XCTestCase {
    
    private let networkUtils = NetworkUtils.shared
    private let constants = Constants()
    private let limit: Int = 20
    private let offset: Int = 0
    private let url = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/12.png"
    private let urlSession = URLSession(configuration: .default)
    private let networkMonitor = NetworkMonitor.shared
    

    override func setUpWithError() throws {
        try super.setUpWithError()
        
    }
    
    override func tearDownWithError() throws {
        
        try super.tearDownWithError()
    }
//MARK: -
    func testValidApiCallGetsHTTPStatusCode200() throws  {
        //check accert code200 for "Get image url" 
        
        try XCTSkipUnless(
            networkMonitor.isReachable,
          "Network connectivity needed for this test.")
        
        // given
        guard let url = URL(string: url) else { return }
        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?

        // when
        let dataTask = urlSession.dataTask(with: url) { _, response, error in
          statusCode = (response as? HTTPURLResponse)?.statusCode
          responseError = error
          promise.fulfill()
        }
        dataTask.resume()
        wait(for: [promise], timeout: 5)

        // then
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }
}
