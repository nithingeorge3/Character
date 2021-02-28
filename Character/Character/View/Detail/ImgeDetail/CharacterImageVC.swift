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
    
    func prepareModel(viewModel: CharacterImageVM) {
        self.viewModel = viewModel
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
