//
//  CharacterDetailVM.swift
//  Character
//
//  Created by Nitin George on 24/02/2021.
//


import UIKit

class CharacterDetailVM: CharacterDetailVMProtocol {
    
    private var character: Character?

    required init(character: Character?) {
        self.character = character
    }
    
    //hardcoded as 2. In future we need to add the bussiness logic based on the UI
    func numberOfSections() -> Int {
        return 2
    }
    
    func numberOfRows(section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return fetchOccupationCount()
        default:
            return 0
        }
    }

    func fetchOccupationCount() -> Int {
        return character?.occupation?.count ?? 0
    }
    
    func fetchNavigationTitle() -> String? {
        return ("\(NSLocalizedString("CharacterDetailTitle", comment: ""))")
    }
    
    func fetchCharactreImageURL() -> URL? {
        return URL(string: character?.img ?? "")
    }
    
    func fetchCharacterName() -> String? {
        return character?.name
    }
    
    func fetchCharacterNickname() -> String? {
        return character?.nickname
    }
    
    func fetchCharacterNameAndNickName() -> NSMutableAttributedString {
        let combination = NSMutableAttributedString()
        if let name = fetchCharacterName() {
            let nameAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 28)]
            let attributedName = NSMutableAttributedString(string: name, attributes: nameAttributes)
            combination.append(attributedName)
        }
        if let nickName = fetchCharacterNickname() {
            let nickNameAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24)]
            let attributedNicName = NSMutableAttributedString(string: " (\(nickName))", attributes: nickNameAttributes)
            combination.append(attributedNicName)
        }
        return combination
    }
    
    func fetchCharacterBirthday() -> String? {
        return character?.birthday
    }
    
    func fetchCharacterStatus() -> String? {
        return character?.status
    }
    
    func fetchCharacterOccupation(index: Int) -> String? {
        if let occupation = character?.occupation?[safe:index] {
            return occupation
        }
        else {
            return nil
        }
    }

    func readSelectedCharacter() -> Character? {
        return character
    }
}


