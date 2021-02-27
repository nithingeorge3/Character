//
//  ProfilePhotoViewCell.swift
//  Character
//
//  Created by Nitin George on 25/02/2021.
//

import UIKit

class ProfilePhotoViewCell: UITableViewCell {
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    
    private var viewModel: ProfilePhotoViewCellVMProtocol!
    weak var delegate: ProfilePhotoViewCellDelegate? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        initUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func prepareCell(viewModel: ProfilePhotoViewCellVM) {
        self.viewModel = viewModel
        setUpUI()
    }
    
    func setUpUI() {
        coverImageView.isUserInteractionEnabled = true
        coverImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(coverImageViewTapped(tapGestureRecognizer:))))
        profileImageView.isUserInteractionEnabled = true
        profileImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(profileImageTapped(tapGestureRecognizer:))))
        profileImageView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        profileImageView.layer.borderWidth = 1.0
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
        profileImageView.clipsToBounds = true
        
        profileImageView.sd_setImage(with: viewModel.fetchCharactreImageURL(), placeholderImage: UIImage(named: "unique_Avatar.png"))
    }
    
    
    @objc func coverImageViewTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        delegate?.coverImageViewTappedTapped()
    }
    
    @objc func profileImageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        delegate?.profileImageTapped()
    }
}
