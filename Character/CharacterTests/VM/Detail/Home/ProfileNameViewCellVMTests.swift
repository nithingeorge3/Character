//
//  ProfileNameViewCellVMTests.swift
//  CharacterTests
//
//  Created by Nitin George on 26/02/2021.
//

import XCTest

class ProfileNameViewCellVMTests: XCTestCase {

    var viewModel: ProfileNameViewCellVMProtocol!
    
    override func setUpWithError() throws {
        let character = Character(charID: 1, name: "George", birthday: "07-08-1993", occupation: ["Teenager"], img: "https://s-i.huffpost.com/gen/1317262/images/o-ANNA-GUNN-facebook.jpg", status: "Alive", nickname: "Geo", appearance: [1,2,3,4], portrayed: nil, category: nil, betterCallSaulAppearance: nil)
        viewModel = ProfileNameViewCellVM(character: character)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPersonalInfo() {
        XCTAssertTrue(viewModel.fetchCharacterName() == "George")
        XCTAssertEqual(viewModel.fetchCharacterNickname(), "Geo")
        XCTAssert(viewModel.fetchCharacterNameAndNickName().string == "George (Geo)")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
