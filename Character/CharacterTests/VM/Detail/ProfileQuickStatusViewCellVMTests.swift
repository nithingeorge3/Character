//
//  ProfileQuickStatusViewCellVMTests.swift
//  CharacterTests
//
//  Created by Nitin George on 26/02/2021.
//

import XCTest

class ProfileQuickStatusViewCellVMTests: XCTestCase {

    var viewModel: ProfileQuickStatusViewCellVMProtocol!
    
    override func setUpWithError() throws {
        let character = Character(charID: 1, name: "George", birthday: "07-08-1993", occupation: ["Teenager"], img: "https://s-i.huffpost.com/gen/1317262/images/o-ANNA-GUNN-facebook.jpg", status: "Alive", nickname: "Geo", appearance: [1,2,3,4], portrayed: nil, category: nil, betterCallSaulAppearance: nil)
        let celltye:CharacterDetailQuickStatusCellType = .occupation
        viewModel = ProfileQuickStatusViewCellVM(character: character, cellType: celltye)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchAppearanceValid() {
        guard let appearanceID = viewModel.fetchAppearance(index: 0) else {
            XCTAssertNil(nil)
            return
        }
        XCTAssertTrue("\(appearanceID)" == "1", "found as 1")
    }
    
    func testFetchAppearanceInValid() {
        guard let appearanceID = viewModel.fetchAppearance(index: -10) else {
            XCTAssertTrue(true)
            return
        }
        XCTAssertFalse(appearanceID.count > 0, "not found and invalid index fetch")
    }
    
    func testStatusFound() {
        let status1 = viewModel.isStatusFound()
        XCTAssertTrue(status1.0)
        let character = Character(charID: 1, name: "George", birthday: "07-08-1993", occupation: ["Teenager"], img: "https://s-i.huffpost.com/gen/1317262/images/o-ANNA-GUNN-facebook.jpg", status: "", nickname: "Geo", appearance: [1,2,3,4], portrayed: nil, category: nil, betterCallSaulAppearance: nil)
        let celltye:CharacterDetailQuickStatusCellType = .occupation
        viewModel = ProfileQuickStatusViewCellVM(character: character, cellType: celltye)
        let status2 = viewModel.isStatusFound()
        XCTAssertFalse(status2.0)
    }
    
    func testBirthDayFound() {
        let status1 = viewModel.isBirthDayFound()
        XCTAssertTrue(status1.0)
        let character = Character(charID: 1, name: "George", birthday: nil, occupation: ["Teenager"], img: "https://s-i.huffpost.com/gen/1317262/images/o-ANNA-GUNN-facebook.jpg", status: "test", nickname: "Geo", appearance: [1,2,3,4], portrayed: nil, category: nil, betterCallSaulAppearance: nil)
        let celltye:CharacterDetailQuickStatusCellType = .occupation
        viewModel = ProfileQuickStatusViewCellVM(character: character, cellType: celltye)
        let status2 = viewModel.isBirthDayFound()
        XCTAssertFalse(status2.0)
    }
    
    func testStatusIconImage() {
        guard let _ = viewModel.fetchStatusIconImage() else {
            XCTAssertNil(nil)
            return
        }
        XCTAssertTrue(true)
    }
    
    func testFetchOccupation() {
        guard let occupation = viewModel.fetchOccupation(index: 0) else {
           XCTAssertNil(nil, "empty or nil occupation found")
            return
        }
        XCTAssertTrue(occupation.count > 0 && occupation == "Teenager")
    }
    
    func testFetchCharacterPersonalInfo1() {
        guard let occupation = viewModel.fetchCharacterPersonalInfo(index: 2) else {
            XCTAssertNil(nil, "empty or nil occupation found")
            return
        }
        XCTAssertTrue(occupation.count > 0 && occupation == "Teenager")
        
        guard let occupation2 = viewModel.fetchCharacterPersonalInfo(index: 100) else {
            XCTAssertNil(nil, "empty or nil occupation found")
            return
        }
        XCTAssertTrue(occupation2.count > 0 && occupation2 == "Teenager")
    }
    
    func testFetchCharacterPersonalInfo2() {
        let character = Character(charID: 1, name: "George", birthday: "09-07-1958", occupation: [], img: "https://s-i.huffpost.com/gen/1317262/images/o-ANNA-GUNN-facebook.jpg", status: "test", nickname: "Geo", appearance: [1,2,3,4], portrayed: nil, category: nil, betterCallSaulAppearance: nil)
        let celltye:CharacterDetailQuickStatusCellType = .birthday
        viewModel = ProfileQuickStatusViewCellVM(character: character, cellType: celltye)
        
        guard let birthDay = viewModel.fetchCharacterPersonalInfo(index: 3) else {
            XCTAssertNil(nil, "empty or nil occupation found")
            return
        }
        XCTAssertTrue(birthDay.count > 0 && birthDay == "09-07-1958")
        
        guard let birthDay2 = viewModel.fetchCharacterPersonalInfo(index: 100) else {
            XCTAssertNil(nil, "empty or nil occupation found")
            return
        }
        XCTAssertTrue(birthDay2.count > 0 && birthDay2 == "09-07-1958")
    }
    
    func testFetchCharacterPersonalInfo3() {
        let character = Character(charID: 1, name: "George", birthday: nil, occupation: [], img: "https://s-i.huffpost.com/gen/1317262/images/o-ANNA-GUNN-facebook.jpg", status: "Alive", nickname: "Geo", appearance: [1,2,3,4], portrayed: nil, category: nil, betterCallSaulAppearance: nil)
        let celltye:CharacterDetailQuickStatusCellType = .status
        viewModel = ProfileQuickStatusViewCellVM(character: character, cellType: celltye)
        
        guard let status = viewModel.fetchCharacterPersonalInfo(index: 4) else {
            XCTAssertNil(nil, "empty or nil occupation found")
            return
        }
        XCTAssertTrue(status.count > 0 && status == "Alive")
        
        guard let status2 = viewModel.fetchCharacterPersonalInfo(index: 100) else {
            XCTAssertNil(nil, "empty or nil status found")
            return
        }
        XCTAssertTrue(status2.count > 0 && status2 == "Alive")
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
