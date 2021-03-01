//
//  ProfileQuickStatusViewCellVM.swift
//  Character
//
//  Created by Nitin George on 26/02/2021.
//

import UIKit

class ProfileQuickStatusViewCellVM: ProfileQuickStatusViewCellVMProtocol {
   
    private var character: Character?
    private var statusCellType:CharacterDetailQuickStatusCellType?
    private var iconImage:UIImage?
    
    required init(character: Character?, cellType: CharacterDetailQuickStatusCellType?) {
        self.character = character
        statusCellType = cellType
    }
    
    func fetchCharacterPersonalInfo(index: Int) -> String? {
        switch statusCellType {
        case .occupation:
            iconImage = UIImage(named: "Occupation")
            let occupationIndex = index - 2 // 2 is the first two cell(image & name) count
            return fetchOccupation(index: occupationIndex)
        case .birthday:
            iconImage = UIImage(named: "birthday")
            if let birthDay = character?.birthday {
                return birthDay
            }
        case .status:
            iconImage = UIImage(named: "status")
            if let status = character?.status {
                return status
            }
        case .appearance:
            iconImage = UIImage(named: "appearance")
            var appearanceStartIndex = 2 // 2 is the first two cell(image & name) count
            if let occupation = character?.occupation, occupation.count > 0 {
                appearanceStartIndex = appearanceStartIndex + occupation.count
            }
            let birthDayCellCount = isBirthDayFound().0 ? 1 : 0
            let statusDayCellCount = isStatusFound().0 ? 1 : 0
            appearanceStartIndex = appearanceStartIndex + birthDayCellCount + statusDayCellCount
            let appearanceIndex = index - appearanceStartIndex
            return fetchAppearance(index: appearanceIndex)
        default:
            iconImage = nil
        }
        return nil
    }
    
    func fetchOccupation(index: Int) -> String? {
        if let occupation = character?.occupation?[safe:index] {
            return occupation
        }
        else {
            return nil
        }
    }
    
    func fetchStatusIconImage() -> UIImage? {
        return iconImage
    }
    
    func isBirthDayFound() -> (Bool, String) {
        if let birthday = character?.birthday, birthday.count > 0 {
            return (true, birthday)
        }
        return (false, "")
    }
    
    func isStatusFound() -> (Bool, String) {
        if let status = character?.status, status.count > 0 {
            return (true, status)
        }
        return (false, "")
    }
    
    func fetchAppearance(index: Int) -> String? {
        if let appearanceID = character?.appearance?[safe:index] {
            return Helper.getAppearanceValue(apperanceID: appearanceID)
        }
        else {
            return nil
        }
    }
}
