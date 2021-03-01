//
//  CharacterFilterVMProtocol.swift
//  Character
//
//  Created by Nitin George on 25/02/2021.
//

import UIKit

protocol CharacterFilterVMProtocol {
    func numberOfRow() -> Int
    func checkMarkSelected(id: Int)
    func checkMarkUnSelected(id: Int)
    func fetchAllSelectedIds() -> [Int]?
    func fetchFilterOptionID(index: Int) -> Int
    func fetchAppearance(apperanceID: Int) -> String
    func fetchSelectedStatus(indexAppearanceID: Int) -> Bool
}
