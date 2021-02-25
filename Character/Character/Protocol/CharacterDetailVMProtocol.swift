//
//  CharacterDetailVMProtocol.swift
//  Character
//
//  Created by Nitin George on 24/02/2021.
//

import UIKit

protocol CharacterDetailVMProtocol {
    func fetchNavigationTitle() -> String?
    func numberOfSections() -> Int
    func numberOfRows(section: Int) -> Int
    func fetchCharactreImageURL() -> URL?
    func fetchCharacterName() -> String?
    func fetchCharacterNickname() -> String?
    func fetchCharacterNameAndNickName() -> NSMutableAttributedString
    func fetchCharacterBirthday() -> String?
    func fetchCharacterStatus() -> String?
    func fetchOccupationCount() -> Int
    func fetchCharacterOccupation(index: Int) -> String?
    func readSelectedCharacter() -> Character?
}

