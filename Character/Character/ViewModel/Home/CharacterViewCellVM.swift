//
//  CharacterViewCellVM.swift
//  Character
//
//  Created by Nitin George on 24/02/2021.
//

import UIKit

class CharacterViewCellVM: CharacterViewCellVMProtocol {

    private var character:Character?
    
    required init(character: Character?) {
        self.character = character
    }
    
    func fetchCharactreImageURL() -> URL? {
        return URL(string: character?.img ?? "")
    }
    
    func fetchCharacterName() -> String? {
        return character?.name
    }
}

