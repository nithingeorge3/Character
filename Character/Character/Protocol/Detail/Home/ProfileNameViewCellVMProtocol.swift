//
//  ProfileNameViewCellVMProtocol.swift
//  Character
//
//  Created by Nitin George on 26/02/2021.
//

import UIKit

protocol ProfileNameViewCellVMProtocol {
    func fetchCharacterNameAndNickName() -> NSMutableAttributedString
    func fetchCharacterName() -> String?
    func fetchCharacterNickname() -> String?
}
