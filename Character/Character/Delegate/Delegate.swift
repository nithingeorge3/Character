//
//  Delegate.swift
//  Character
//
//  Created by Nitin George on 24/02/2021.
//

import Foundation

import Foundation
import UIKit

public protocol CharacterFilterVCDelegate :AnyObject {
    func doneButtonTouched(appearanceID: [Int]?)
}

public protocol CharacterFilterViewCellDelegate :AnyObject {
    func checkMarkSelected(_ sender: UIButton)
    func checkMarkUnSelected(_ sender: UIButton)
}

public protocol ProfilePhotoTableViewCellDelegate : AnyObject {
    func coverImageViewTappedTapped()
    func profileImageTapped()
}
