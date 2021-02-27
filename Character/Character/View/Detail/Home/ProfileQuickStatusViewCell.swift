//
//  ProfileQuickStatusViewCell.swift
//  Character
//
//  Created by Nitin George on 25/02/2021.
//

import UIKit

class ProfileQuickStatusViewCell: UITableViewCell {

    @IBOutlet weak var statusImageView: UIImageView!
    @IBOutlet weak var statusLbl: UILabel!
    
    private var viewModel: ProfileQuickStatusViewCellVMProtocol!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func prepareCell(viewModel: ProfileQuickStatusViewCellVM) {
        self.viewModel = viewModel
        setUpUI()
    }
    
    func setUpUI() {
        statusLbl.text = viewModel.fetchCharacterPersonalInfo(index: self.tag)
        statusImageView.image = viewModel.fetchStatusIconImage()
    }
}
