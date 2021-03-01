//
//  CharacterFilterVM.swift
//  Character
//
//  Created by Nitin George on 25/02/2021.
//

import UIKit

class CharacterFilterVM: CharacterFilterVMProtocol {
    
    private var seasonAppearanceList:[Int]?
    private var selectedAppearance:Set<Int> = []
    
    required init(seasonAppearanceList: [Int]?, selectedID: [Int]?) {
        self.seasonAppearanceList = seasonAppearanceList
        if let ids = selectedID {
            selectedAppearance = Set(ids)
        }
    }
    
    func numberOfRow() -> Int {
        return seasonAppearanceList?.count ?? 0
    }
    
    func checkMarkSelected(id: Int) {
        selectedAppearance.insert(id)
    }
    
    func checkMarkUnSelected(id: Int) {
        selectedAppearance.remove(id)
    }
    
    func fetchAllSelectedIds() -> [Int]? {
        return Array(selectedAppearance).sorted()
    }
    
    func fetchFilterOptionID(index: Int) -> Int {
        return seasonAppearanceList?[index] ?? 0
    }
    func fetchAppearance(apperanceID: Int) -> String {
        return Helper.getAppearanceValue(apperanceID: apperanceID)
    }
    
    func fetchSelectedStatus(indexAppearanceID: Int) -> Bool {
        let contain = selectedAppearance.contains(where: { $0 == indexAppearanceID })
        return contain ? true : false
    }
}


