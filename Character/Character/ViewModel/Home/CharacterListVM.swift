//
//  CharacterListVM.swift
//  Character
//
//  Created by Nitin George on 24/02/2021.
//

import UIKit

enum UserFlow {
    case listCharacters
    case listSearchResult
    case listFilterResult
}

class CharacterListVM: CharacterListViewModelProtocol {

    private var apiManager: APICharacterProtocol?
    private var characterList: [Character]?
    private var searchCharacterList: [Character]?
    private var filterCharacterList:[Character]? = []
    private var userFlow:UserFlow = .listCharacters
    private var lastSelectedUserFlow:UserFlow = .listCharacters
    private var selectedAppearanceID:[Int]? = []
    
    required init(apiManager: APICharacterProtocol) {
        self.apiManager = apiManager
    }
    
    func fetchNavigationTitle() -> String? {
        return ("\(NSLocalizedString("CharacterHomeNavTitle", comment: ""))")
    }
    
    func fetchCharacters(completion: @escaping (Bool) -> Void) {
        apiManager?.fetchCharacters(completion: { [weak self](isSucess, characterList) in
            if isSucess {
                guard let character = characterList else {
                    completion(true)
                    return
                }
                self?.characterList = character
                self?.userFlow = .listCharacters
                completion(true)
            }
            else {
                completion(false)
            }
        })
    }
    
    func numberOfItem() -> Int {
        switch userFlow {
        case .listCharacters:
            return characterList?.count ?? 0
        case .listSearchResult:
            return searchCharacterList?.count ?? 0
        case .listFilterResult:
            return filterCharacterList?.count ?? 0
        }
    }
    
    func searchCharacterByName(name:String) -> Bool {
        if name.isEmpty {
            searchCharacterList?.removeAll()
            //for maintain last listing type
            userFlow = lastSelectedUserFlow
            return true
        }
        let activeCharacterList:[Character]? = lastSelectedUserFlow == .listCharacters ? characterList : filterCharacterList
        userFlow = .listSearchResult
        searchCharacterList?.removeAll()
        if let results = activeCharacterList?.filter({ ($0.name?.contains(name) ?? false) }), results.count > 0 {
            searchCharacterList = results
            return true
        }
        return false
    }
    
    func fetchSelectedCharacter(selectedIndex: Int) -> Character? {
        switch userFlow {
        case .listCharacters:
            return selectedCharcter(listArray: characterList, selectedIndex: selectedIndex)
        case .listSearchResult:
            return selectedCharcter(listArray: searchCharacterList, selectedIndex: selectedIndex)
        case .listFilterResult:
            return selectedCharcter(listArray: filterCharacterList, selectedIndex: selectedIndex)
        }
    }
    
    private func selectedCharcter(listArray: [Character]?, selectedIndex: Int)  -> Character? {
        guard let selectedCharacter = listArray?[safe:selectedIndex] else {
            return nil
        }
        return selectedCharacter
    }
    
    func errorMessage() -> String {
        var errorMessage:String?
        switch userFlow {
        case .listCharacters:
            errorMessage =  NSLocalizedString("NoCharacterListErrorMessage", comment: "")
        case .listSearchResult:
            errorMessage = NSLocalizedString("NoCharacterSearchResult", comment: "")
        case .listFilterResult:
            errorMessage = NSLocalizedString("NoCharacterFilterResult", comment: "")
        }
        return errorMessage ?? ""
    }
    
    func fetchSeasonAppearanceList() -> [Int]? {
        guard let charctList = characterList else {
            return nil
        }
        var result:Set<Int> = []
        for character in charctList {
            if let appearance = character.appearance {
                result = result.union(appearance)
            }
        }
        return Array(result).sorted()
    }
    
    func fetchCharacterSeasonResult(appearanceID: [Int]?) -> Bool { 
        filterCharacterList?.removeAll()
        selectedAppearanceID?.removeAll()
        guard let appearanceID = appearanceID, appearanceID.count > 0 else {
            userFlow = .listCharacters
            return true
        }
        selectedAppearanceID = appearanceID
        userFlow = .listFilterResult
        let _ = characterList?.filter { (character) -> Bool in
            for id in appearanceID {
                let contain = character.appearance?.contains(where: { $0 == id })
                if let found = contain, found {
                    lastSelectedUserFlow = .listFilterResult
                    filterCharacterList?.append(character)
                    return true
                }
            }
            return filterCharacterList?.count == 0 ? false : true
        }
        return filterCharacterList?.count == 0 ? false : true
    }
    
    func fetchSelectedAppearanceID() -> [Int]? {
        return selectedAppearanceID
    }
}
