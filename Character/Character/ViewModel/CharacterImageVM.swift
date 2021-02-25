//
//  CharacterImageVM.swift
//  Character
//
//  Created by Nitin George on 25/02/2021.
//

import UIKit

class CharacterImageVM: CharacterImageVMProtocol {
    
    private var character: Character?

    required init(character: Character?) {
        self.character = character
    }
    
    func fetchProfileImages() -> [URL]? {
        guard let imageURL = character?.img else {
            return nil
        }
        let url = [URL(imageURL)]
        print(url)
        return url
    }
}
