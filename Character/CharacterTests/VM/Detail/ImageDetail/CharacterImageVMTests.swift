//
//  CharacterImageVMTests.swift
//  CharacterTests
//
//  Created by Nitin George on 28/02/2021.
//

import XCTest

class CharacterImageVMTests: XCTestCase {

    var viewModel: CharacterImageVMProtocol! = nil
    
    override func setUpWithError() throws {
        let character = Character(charID: 1, name: "George", birthday: "07-08-1993", occupation: ["Teenager"], img: "https://s-i.huffpost.com/gen/1317262/images/o-ANNA-GUNN-facebook.jpg", status: "Alive", nickname: "Geo", appearance: [1,2,3,4], portrayed: "Anna Gunn", category: "Breaking Bad", betterCallSaulAppearance: [])
        viewModel = CharacterImageVM(character: character)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchImageURL() {
        let imageURL = viewModel.fetchProfileImages()
        guard let image = imageURL, image.count > 0 else {
            XCTFail("nil value found")
            return
        }
        XCTAssertTrue(image.count > 0)
    }

    func testNilImage() {
        let character = Character(charID: 1, name: "George", birthday: "07-08-1993", occupation: ["Teenager"], img: nil, status: "Alive", nickname: "Geo", appearance: [1,2,3,4], portrayed: "Anna Gunn", category: "Breaking Bad", betterCallSaulAppearance: [])
        viewModel = CharacterImageVM(character: character)
        let imageURL = viewModel.fetchProfileImages()
        guard let image = imageURL, image.count > 0 else {
            XCTAssertTrue(true, "empty/nil image URL")
            return
        }
        XCTAssertNil(false)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
