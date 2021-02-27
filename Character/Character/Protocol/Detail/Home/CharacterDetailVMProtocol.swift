//
//  CharacterDetailVMProtocol.swift
//  Character
//
//  Created by Nitin George on 24/02/2021.
//

import UIKit

protocol CharacterDetailVMProtocol {
    func fetchNavigationTitle() -> String?
    func cellType(forIndex indexPath: IndexPath)-> CharacterHomeTableCellType
    func numberOfSections() -> Int
    func numberOfRows(section: Int) -> Int
    func fetchCharacterName() -> String?
    func fetchCharactreImageURL() -> URL?
    func fetchCharacterBirthday() -> String?
    func fetchCharacterStatus() -> String?
    func fetchOccupationCount() -> Int
    func fetchAppearanceCount() -> Int
    func readSelectedCharacter() -> Character?
}
