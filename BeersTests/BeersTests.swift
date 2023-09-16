//
//  BeersTests.swift
//  BeersTests
//
//  Created by Gian Rivera on 16/09/23.
//

import XCTest
@testable import Beers

final class BeersTests: XCTestCase {
    
    let viewModel = BeerViewModel()
    let manager = BeersManager()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
    }
    
    func testLoadDefaultBeersList() {
        viewModel.loadDefultInformation()
        XCTAssertTrue(self.viewModel.beerList.count > 0)
    }
    
    func testLoadBeersData() {
        let expectation = XCTestExpectation(
            description: "Owner fetches data and updates list."
        )
        viewModel.onLoadView()
        let asyncWaitDuration = 2.0
        DispatchQueue.main.asyncAfter(deadline: .now() + asyncWaitDuration) {  [weak self] in
            guard let self = self else { return }
            expectation.fulfill()
            XCTAssert(self.viewModel.beerList.count > 0)
        }
        wait(for: [expectation], timeout: TimeInterval(asyncWaitDuration))
    }
    
    func testSearch() {
        viewModel.onLoadView()
        let asyncWaitDuration = 2.0
        DispatchQueue.main.asyncAfter(deadline: .now() + asyncWaitDuration) { [weak self] in
            guard let self = self else { return }
            self.viewModel.searchText = "Buzz"
            XCTAssertTrue(self.viewModel.filteredBeer.count >= 1)
            
            self.viewModel.searchText = "test"
            XCTAssertTrue(self.viewModel.filteredBeer.count == 0)
            
            self.viewModel.searchText = ""
            XCTAssertTrue(self.viewModel.filteredBeer.count > 0)
            
            XCTAssert(self.viewModel.filteredBeerMorethan5.count > 0)
        }
    }
    
}
