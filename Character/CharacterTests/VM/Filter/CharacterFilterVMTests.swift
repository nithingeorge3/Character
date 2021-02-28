//
//  CharacterFilterVMTests.swift
//  CharacterTests
//
//  Created by Nitin George on 26/02/2021.
//

import XCTest

class CharacterFilterVMTests: XCTestCase {

    var viewModel: CharacterFilterVMProtocol!
    
    override func setUpWithError() throws {
        let appearanceID = [1,2,3,4,5]
        let selectedID:[Int]? = [1]
        viewModel = CharacterFilterVM(seasonAppearanceList: appearanceID, selectedID: selectedID)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNumberOfRow() {
        XCTAssertTrue(viewModel.numberOfRow() == 5)
    }
    
    func testFistOptionSelected() {
        viewModel.checkMarkSelected(id: 1)
        let ids = viewModel.fetchAllSelectedIds()
        guard let myIds = ids else {
            XCTFail("nil value found")
            return
        }
        XCTAssertTrue(myIds.count > 0)
        XCTAssertTrue(myIds[0] == 1)
    }
    
    func testCheckMarkUnSelected() {
        viewModel.checkMarkUnSelected(id: 1)
        let ids = viewModel.fetchAllSelectedIds()
        guard let myIds = ids else {
            XCTFail("nil value found")
            return
        }
        XCTAssertTrue(myIds.count == 0)
    }
    
    func tetsFetchAllSelectedIds() {
        viewModel.checkMarkSelected(id: 1)
        viewModel.checkMarkSelected(id: 2)
        viewModel.checkMarkSelected(id: 4)
        viewModel.checkMarkSelected(id: 5)
        viewModel.checkMarkSelected(id: 3)
        let selectedIds = viewModel.fetchAllSelectedIds()
        XCTAssertTrue(selectedIds?.count == 4)
        XCTAssertTrue(selectedIds?[0] == 1)
    }
    
    func testFetchFilterOptionID() {
        let id = viewModel.fetchFilterOptionID(index: 1)
        XCTAssertTrue(id == 2)
    }
    
    func testFetchAppearance() {
        let id = viewModel.fetchAppearance(index: 1)
        XCTAssertTrue(id == "2")
    }
    
    func testFetchSelectedStatus() {
        let status = viewModel.fetchSelectedStatus(indexAppearanceID: 1)
        XCTAssert(status)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
