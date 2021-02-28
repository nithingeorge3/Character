//
//  Delegate.swift
//  Character
//
//  Created by Nitin George on 24/02/2021.
//

import Foundation
import UIKit

public protocol CharacterFilterVCDelegate: class {
    func doneButtonTouched(appearanceID: [Int]?)
}

public protocol CharacterFilterViewCellDelegate: class {
    func checkMarkSelected(_ sender: UIButton)
    func checkMarkUnSelected(_ sender: UIButton)
}

public protocol ProfilePhotoViewCellDelegate: class {
    func coverImageViewTappedTapped()
    func profileImageTapped()
}
