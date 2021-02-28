//
//  CharacterListTableViewCellVMProtocol.swift
//  Character
//
//  Created by Nitin George on 24/02/2021.
//

import UIKit

protocol CharacterViewCellVMProtocol {
    func fetchCharacterImageURL() -> URL?
    func fetchCharacterName() -> String?
}
