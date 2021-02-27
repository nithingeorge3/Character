//
//  ProfileNameViewCellVM.swift
//  Character
//
//  Created by Nitin George on 26/02/2021.
//

import  UIKit

class ProfileNameViewCellVM: ProfileNameViewCellVMProtocol {
    
    private var character: Character?
    
    required init(character: Character?) {
        self.character = character
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
    
    func fetchCharacterName() -> String? {
        return character?.name
    }
    
    func fetchCharacterNickname() -> String? {
        return character?.nickname
    }
    
}
