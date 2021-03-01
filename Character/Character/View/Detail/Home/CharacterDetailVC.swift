//
//  CharacterDetailVC.swift
//  Character
//
//  Created by Nitin George on 24/02/2021.
//

import UIKit
import SDWebImage

class CharacterDetailVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: CharacterDetailVMProtocol!
    private var character:Character?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        prepareTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.presentTransparentNavigationBar()
    }
    
    internal static func instantiate(with viewModel: CharacterDetailVMProtocol, character: Character?) -> CharacterDetailVC? {
        guard let vc = sb?.instantiateViewController(withIdentifier: "CharacterDetailVC") as? CharacterDetailVC else {
            return nil
        }
        vc.viewModel = viewModel
        vc.character = character
        return vc
    }
    
    private func prepareTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func setUpUI() {
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        title = viewModel.fetchCharacterName()
    }
}

extension CharacterDetailVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}

extension CharacterDetailVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return UITableView.automaticDimension
   }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = viewModel.cellType(forIndex: indexPath)
        switch cellType {
        case .photoCell(let model):
            return cellForPhotoViewCell(indexPath: indexPath, viewModel: model)
        case .nameCell(model: let model):
            return cellForNameViewCell(indexPath: indexPath, viewModel: model)
        case .quickStatusCell(type: let statusCellType, model: let model):
            return cellForQuickStatusViewCell(indexPath: indexPath, type: statusCellType, viewModel: model)

        }
    }
    
    // MARK: - Load Custom Cells
    func cellForPhotoViewCell(indexPath: IndexPath, viewModel: ProfilePhotoViewCellVMProtocol) -> ProfilePhotoViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfilePhotoViewCell", for:indexPath) as! ProfilePhotoViewCell
        cell.selectionStyle = .none
        cell.delegate = self
        cell.prepareCell(viewModel: viewModel as! ProfilePhotoViewCellVM)
        return cell
    }
    
    func cellForNameViewCell(indexPath: IndexPath, viewModel: ProfileNameViewCellVMProtocol) -> ProfileNameViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileNameViewCell", for:indexPath) as! ProfileNameViewCell
        cell.selectionStyle = .none
        cell.prepareCell(viewModel: viewModel as! ProfileNameViewCellVM)
        return cell
    }
    
    func cellForQuickStatusViewCell(indexPath: IndexPath, type: CharacterDetailQuickStatusCellType, viewModel: ProfileQuickStatusViewCellVMProtocol) -> ProfileQuickStatusViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileQuickStatusViewCell", for:indexPath) as! ProfileQuickStatusViewCell
        cell.selectionStyle = .none
        cell.tag = indexPath.row
        cell.prepareCell(viewModel: viewModel as! ProfileQuickStatusViewCellVM)
        return cell
    }
}

// MARK: Button Actions
extension CharacterDetailVC: ProfilePhotoViewCellDelegate {

    func coverImageViewTappedTapped() {
    }
    
    func profileImageTapped() {
        AppRouter.showCharacterImageVC(navigationConroller: navigationController ?? UINavigationController(), character: viewModel.readSelectedCharacter())
    }
}
