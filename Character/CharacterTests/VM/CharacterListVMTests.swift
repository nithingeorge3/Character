//
//  CharacterListVMTests.swift
//  CharacterTests
//
//  Created by Nitin George on 24/02/2021.
//

import XCTest

class CharacterListVMTests: XCTestCase {

    var apiManager: APICharacterProtocol = CharacterServicesMock()
    var viewModel: CharacterListViewModelProtocol!
    
    override func setUp() {
        super.setUp()
        viewModel = CharacterListVM(apiManager: apiManager)
        viewModel.fetchCharacters { (isSuccess) in
            XCTAssertTrue(isSuccess)
        }
    }
    
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {

    }
    
    func testValidNavigationTitle() {
        XCTAssertEqual(viewModel.fetchNavigationTitle(), NSLocalizedString("CharacterHomeNavTitle", comment: ""))
    }
    
    func testInValidNavigationTitle() {
        XCTAssert(viewModel.fetchNavigationTitle() != "\(NSLocalizedString("SearchBarPlaceholder", comment: ""))")
    }
    
    func testNumberOfItem() {
        let rowCount = viewModel.numberOfItem()
        XCTAssert(rowCount == 62)
    }
    
    func testSearchWithResult() {
        XCTAssertTrue(viewModel.searchCharacterByName(name: "Walter White"))
        XCTAssert(viewModel.numberOfItem() == 2)
    }
    
    func testSearchWithNoResult() {
        XCTAssertFalse(viewModel.searchCharacterByName(name: "XXXXXXXXXX"))
        XCTAssert(viewModel.numberOfItem() == 0)
    }
    
    func testFetchCharacterWithInvalidIndex() {
        let selectedCharacter = viewModel.fetchSelectedCharacter(selectedIndex: -100)
        XCTAssertNil(selectedCharacter)
    }
    
    func testFetchSelectedCharacter() {
        let selectedCharacter = viewModel.fetchSelectedCharacter(selectedIndex: 0)
        XCTAssert(selectedCharacter?.name == "Walter White")
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
