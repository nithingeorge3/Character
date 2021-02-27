//
//  APICharacterProtocol.swift
//  Character
//
//  Created by Nitin George on 24/02/2021.
//

import UIKit

protocol  APICharacterProtocol {
    func fetchCharacters(completion: @escaping (_ isSuccess: Bool,_ characterDetails: [Character]?) -> Void)
}



