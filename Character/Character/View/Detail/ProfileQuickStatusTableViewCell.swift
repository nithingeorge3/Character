//
//  ProfileQuickStatusTableViewCell.swift
//  Character
//
//  Created by Nitin George on 25/02/2021.
//

import UIKit

class ProfileQuickStatusTableViewCell: UITableViewCell {

    @IBOutlet weak var statusImageView: UIImageView!
    @IBOutlet weak var statusLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
