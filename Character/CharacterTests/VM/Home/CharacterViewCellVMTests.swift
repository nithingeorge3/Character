//
//  CharacterViewCellVMTests.swift
//  CharacterTests
//
//  Created by Nitin George on 26/02/2021.
//

import XCTest

class CharacterViewCellVMTests: XCTestCase {

    var viewModel: CharacterViewCellVMProtocol!
    
    override func setUpWithError() throws {
        let character = Character(charID: 1, name: "George", birthday: "07-08-1993", occupation: ["Teenager"], img: "https://s-i.huffpost.com/gen/1317262/images/o-ANNA-GUNN-facebook.jpg", status: "Alive", nickname: "Geo", appearance: [1,2,3,4], portrayed: nil, category: nil, betterCallSaulAppearance: nil)
        viewModel = CharacterViewCellVM(character: character)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchCharacterImageURL() {
        let url = viewModel.fetchCharacterImageURL()
        XCTAssertEqual(url, URL(string: "https://s-i.huffpost.com/gen/1317262/images/o-ANNA-GUNN-facebook.jpg"))
        let character = Character(charID: 1, name: "George", birthday: nil, occupation: [], img: nil, status: nil, nickname: "Geo", appearance: [], portrayed: nil, category: nil, betterCallSaulAppearance: nil)
        viewModel = CharacterViewCellVM(character: character)
        let emptyURL = viewModel.fetchCharacterImageURL()
        XCTAssertTrue(emptyURL == URL(string: ""))
    }

    func testFetchCharacterName() {
        let name = viewModel.fetchCharacterName()
        XCTAssertTrue(name == "George")
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
