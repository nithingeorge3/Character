//
//  CharacterDetailVM.swift
//  Character
//
//  Created by Nitin George on 24/02/2021.
//


import UIKit

enum CharacterDetailQuickStatusCellType {
    case occupation
    case birthday
    case status
    case appearance
}
// Enum to distinguish different home cell types
enum CharacterHomeTableCellType {
    case photoCell(model: ProfilePhotoViewCellVMProtocol)
    case nameCell(model: ProfileNameViewCellVMProtocol)
    case quickStatusCell(type: CharacterDetailQuickStatusCellType, model: ProfileQuickStatusViewCellVMProtocol)
}

class CharacterDetailVM: CharacterDetailVMProtocol {

    private var character: Character?
    private var tableDataSource: [CharacterHomeTableCellType] = [CharacterHomeTableCellType]()
    
    required init(character: Character?) {
        self.character = character
        prepareTableDataSource()
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(section: Int) -> Int {
        return tableDataSource.count
    }

    // Provides the view with appropriate cell type corresponding to an index.
    func cellType(forIndex indexPath: IndexPath) -> CharacterHomeTableCellType {
        tableDataSource[indexPath.row]
    }
    
    func fetchOccupationCount() -> Int {
        return character?.occupation?.count ?? 0
    }
    
    func fetchAppearanceCount() -> Int {
        return character?.appearance?.count ?? 0
    }
    
    func fetchNavigationTitle() -> String? {
        return ("\(NSLocalizedString("CharacterDetailTitle", comment: ""))")
    }
    
    func fetchCharacterName() -> String? {
        return character?.name
    }
    
    func fetchCharactreImageURL() -> URL? {
        return URL(string: character?.img ?? "")
    }
    
    func fetchCharacterBirthday() -> String? {
        return character?.birthday
    }
    
    func fetchCharacterStatus() -> String? {
        return character?.status
    }

    func readSelectedCharacter() -> Character? {
        return character
    }
    
    // Prepare the tableDataSource
    private func prepareTableDataSource() {
        tableDataSource.append(cellTypeForPhotoCell())
        tableDataSource.append(cellTypeForNameCell())
        let occupationCount = fetchOccupationCount()
        if  occupationCount > 0 {
            for _ in 1...occupationCount {
                tableDataSource.append(cellTypeForQuickStatusCell(cellType: .occupation))
            }
        }
        if let birthDay = character?.birthday, birthDay.count > 0 {
            tableDataSource.append(cellTypeForQuickStatusCell(cellType: .birthday))
        }
        if let status = character?.status, status.count > 0 {
            tableDataSource.append(cellTypeForQuickStatusCell(cellType: .status))
        }
        let appearanceCount = fetchAppearanceCount()
        if appearanceCount > 0 {
            for _ in 1...appearanceCount {
                tableDataSource.append(cellTypeForQuickStatusCell(cellType: .appearance))
            }
        }
    }
    
    private func cellTypeForPhotoCell()-> CharacterHomeTableCellType {
        let photoCellVM = ProfilePhotoViewCellVM(character:character)
        return CharacterHomeTableCellType.photoCell(model: photoCellVM)
    }
    
    private func cellTypeForNameCell()-> CharacterHomeTableCellType {
        let nameCellVM = ProfileNameViewCellVM(character:character)
        return CharacterHomeTableCellType.nameCell(model: nameCellVM)
    }
    
    private func cellTypeForQuickStatusCell(cellType: CharacterDetailQuickStatusCellType) -> CharacterHomeTableCellType {
        let quickCellVM = ProfileQuickStatusViewCellVM(character: character, cellType: cellType)
        return CharacterHomeTableCellType.quickStatusCell(type: cellType, model: quickCellVM)
    }
}
