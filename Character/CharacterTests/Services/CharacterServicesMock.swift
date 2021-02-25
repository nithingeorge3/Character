//
//  CharacterServicesMock.swift
//  Character
//
//  Created by Nitin George on 24/02/2021.
//

import Foundation
import UIKit

final class CharacterServicesMock: APICharacterProtocol {
    func fetchCharacters(completion: @escaping (Bool, [Character]?) -> Void) {
        var apiResult:Data?
        do {
            apiResult = try Data.init(contentsOf: Bundle.main.url(forResource: "MockCharacter", withExtension: "json")!)
            if let apiResult = apiResult {
                let characters = try JSONDecoder().decode([Character].self, from: apiResult)
                completion(true, characters)
            }
        } catch _ as NSError {
            completion(false, nil)
        }
    }
}
