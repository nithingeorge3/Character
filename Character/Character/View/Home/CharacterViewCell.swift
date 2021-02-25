//
//  CharacterViewCell.swift
//  Character
//
//  Created by Nitin George on 24/02/2021.
//

import UIKit
import SDWebImage

class CharacterViewCell: UICollectionViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    private var viewModel: CharacterViewCellVMProtocol!
    
    func prepareCell(viewModel: CharacterViewCellVM) {
        self.viewModel = viewModel
        setUpUI()
    }

    private func setUpUI() {
        profileImageView.sd_setImage(with: viewModel.fetchCharactreImageURL(), placeholderImage: UIImage(named: "unique_Avatar.png"))
        nameLabel.text = viewModel.fetchCharacterName() ?? ""
    }
}
