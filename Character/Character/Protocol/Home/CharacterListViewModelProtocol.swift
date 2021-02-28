//
//  CharacterListViewModelProtocol.swift
//  Character
//
//  Created by Nitin George on 24/02/2021.
//

import UIKit

protocol  CharacterListViewModelProtocol {
    func fetchNavigationTitle() -> String?
    func fetchCharacters(completion: @escaping (_ isSuccess: Bool) -> Void)
    func numberOfItem() -> Int
    func searchCharacterByName(name:String) -> Bool
    func fetchSelectedCharacter(selectedIndex: Int) -> Character?
    func errorMessage() -> String
    func fetchSeasonAppearanceList() -> [Int]?
    func fetchCharacterSeasonResult(appearanceID: [Int]?) -> Bool
    func fetchSelectedAppearanceID() -> [Int]?
}
