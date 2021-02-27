//
//  ProfileQuickStatusViewCellVMProtocol.swift
//  Character
//
//  Created by Nitin George on 26/02/2021.
//


import UIKit

protocol ProfileQuickStatusViewCellVMProtocol {
    func fetchOccupation(index: Int) -> String?
    func fetchAppearance(index: Int) -> String?
    func fetchCharacterPersonalInfo(index: Int) -> String?
    func isStatusFound() -> (Bool, String)
    func isBirthDayFound() -> (Bool, String)
    func fetchStatusIconImage() -> UIImage?
}
