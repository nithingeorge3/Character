//
//  CharacterDetailVMTests.swift
//  CharacterTests
//
//  Created by Nitin George on 26/02/2021.
//

import XCTest

class CharacterDetailVMTests: XCTestCase {

    var viewModel:CharacterDetailVMProtocol!
    
    override func setUpWithError() throws {
        let character = Character(charID: 1, name: "George", birthday: "07-08-1993", occupation: ["Teenager"], img: "https://s-i.huffpost.com/gen/1317262/images/o-ANNA-GUNN-facebook.jpg", status: "Alive", nickname: "Geo", appearance: [1,2,3,4], portrayed: "Anna Gunn", category: "Breaking Bad", betterCallSaulAppearance: [])
        viewModel = CharacterDetailVM(character: character)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNumberOfSections() {
        XCTAssertTrue(viewModel.numberOfSections() == 2)
    }
    
    func testNumberOfRowSections() {
        XCTAssertTrue(viewModel.numberOfRows(section: 0) == 2)
        XCTAssertTrue(viewModel.numberOfRows(section: 1) == viewModel.fetchOccupationCount())
    }
    
    func testFetchNavigationTitle() {
        XCTAssertEqual(viewModel.fetchNavigationTitle(), "\(NSLocalizedString("CharacterDetailTitle", comment: ""))")
    }
    
    func testFetchCharactreImageURL() {
        let url = viewModel.fetchCharactreImageURL()
        XCTAssertTrue(url == URL("https://s-i.huffpost.com/gen/1317262/images/o-ANNA-GUNN-facebook.jpg"))
    }
    
    func testFetchCharacterName() {
        XCTAssertTrue(viewModel.fetchCharacterName() == "George")
        XCTAssertEqual(viewModel.fetchCharacterNickname(), "Geo")
        XCTAssert(viewModel.fetchCharacterNameAndNickName().string == "George (Geo)")
    }
    func testPersonalInfo() {
        XCTAssert(viewModel.fetchCharacterBirthday() == "07-08-1993")
        XCTAssertEqual(viewModel.fetchCharacterStatus(), "Alive")
        XCTAssertNil(viewModel.fetchCharacterOccupation(index: 100))
        XCTAssertTrue(viewModel.fetchCharacterOccupation(index: 0) == "Teenager")
        let currentCharacter = viewModel.readSelectedCharacter()
        XCTAssert(currentCharacter?.name == "George")
    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
