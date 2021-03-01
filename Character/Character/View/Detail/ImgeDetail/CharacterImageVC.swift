//
//  CharacterImageVC.swift
//  Character
//
//  Created by Nitin George on 25/02/2021.
//

import UIKit

class CharacterImageVC: UIViewController {

    @IBOutlet weak var characterImage: UIImageView!
    
    private var viewModel: CharacterImageVMProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    internal static func instantiate(with viewModel: CharacterImageVMProtocol) -> CharacterImageVC? {
        guard let vc = sb?.instantiateViewController(withIdentifier: "CharacterImageVC") as? CharacterImageVC else {
            return nil
        }
        vc.viewModel = viewModel
        return vc
    }
    
    func initUI() {
        navigationController?.hideTransparentNavigationBar()
        if let images = viewModel.fetchProfileImages(), images.count > 0 {
            characterImage.sd_setImage(with: images[0], placeholderImage: UIImage(named: "unique_Avatar.png"))
        }
    }
    
    @IBAction func closeButtonTouched(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
}
