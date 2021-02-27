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
    
    func testSearchCharacterDetail() {
        _ = viewModel.searchCharacterByName(name: "Walter")
        let character = viewModel.fetchSelectedCharacter(selectedIndex: 1)
        XCTAssertTrue(character?.name == "Walter White Jr.")
    }
    
    func testFilterCharacterDetail() {
        _ = viewModel.fetchFilteredResult(appearanceID: [1])
        let character = viewModel.fetchSelectedCharacter(selectedIndex: 0)
        XCTAssertTrue(character?.name == "Walter White")
    }
    
    func testEmptyFetchFilteredResult() {
        let isFound = viewModel.fetchFilteredResult(appearanceID: [])
        XCTAssertFalse(!isFound)
    }
    
    func testFetchFilteredResult() {
        let isFound = viewModel.fetchFilteredResult(appearanceID: [4,5])
        XCTAssertTrue(isFound)
    }
    
    func testFetchSelectedAppearanceID(){
        _ = viewModel.fetchFilteredResult(appearanceID: [3,4])
        guard let filteredIDs = viewModel.fetchSelectedAppearanceID() else {
            XCTAssertNil(nil)
            return
        }
        XCTAssertTrue(filteredIDs[0] == 3, "Success")
    }
    
    func testFetchSeasonAppearanceList() {
        guard let ids = viewModel.fetchSeasonAppearanceList() else {
            XCTAssertNil(nil)
            return
        }
        XCTAssert(ids == [1,2,3,4,5])
    }
    
    func testErrorMessage() {
        XCTAssertFalse(viewModel.searchCharacterByName(name: "XXXXXXXXXX"))
        XCTAssertEqual(viewModel.errorMessage(), NSLocalizedString("NoCharacterSearchResult", comment: ""))
        _ = viewModel.fetchFilteredResult(appearanceID: [100])
        XCTAssertEqual(viewModel.errorMessage(), NSLocalizedString("NoCharacterFilterResult", comment: ""))
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
