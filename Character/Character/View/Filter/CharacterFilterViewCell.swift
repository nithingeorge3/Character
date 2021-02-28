//
//  CharacterFilterViewCell.swift
//  Character
//
//  Created by Nitin George on 24/02/2021.
//

import UIKit

class CharacterFilterViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var selectionButton: UIButton!
    @IBOutlet weak var bottomSeparator: UIView!
    
    weak var delegate: CharacterFilterViewCellDelegate? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func initView() {
        
    }
    
    @IBAction func selectionButtonTouched(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            delegate?.checkMarkUnSelected(sender)
        } else {
            sender.isSelected = true
            delegate?.checkMarkSelected(sender)
        }
    }
}
