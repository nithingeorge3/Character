//
//  ProfilePhotoViewCellVM.swift
//  Character
//
//  Created by Nitin George on 26/02/2021.
//

import UIKit

class ProfilePhotoViewCellVM: ProfilePhotoViewCellVMProtocol {
    
    private var character: Character?
    
    required init(character: Character?) {
        self.character = character
    }
    
    func fetchCharactreImageURL() -> URL? {
        return URL(string: character?.img ?? "")
    }
}
