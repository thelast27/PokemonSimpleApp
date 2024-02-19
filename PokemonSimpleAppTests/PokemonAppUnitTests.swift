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
    
    @Environment(\.managedObjectContext) var context
    
    override func setUpWithError() throws {
      try super.setUpWithError()
      cd = CoreDataManager()
    }
    
    override func tearDownWithError() throws {
        cd = nil
      try super.tearDownWithError()
    }
    
    func testCoreData() throws {
        XCTAssertEqual(cd?.container.viewContext.persistentStoreCoordinator?.persistentStores.count, 1)
    }
}
