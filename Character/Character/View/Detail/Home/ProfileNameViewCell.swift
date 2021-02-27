//
//  ProfileNameViewCell.swift
//  Character
//
//  Created by Nitin George on 25/02/2021.
//

import UIKit

class ProfileNameViewCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    
    private var viewModel: ProfileNameViewCellVMProtocol!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func prepareCell(viewModel: ProfileNameViewCellVM) {
        self.viewModel = viewModel
        setUpUI()
    }
    
    func setUpUI() {
        nameLbl.attributedText = viewModel.fetchCharacterNameAndNickName()
    }
}
