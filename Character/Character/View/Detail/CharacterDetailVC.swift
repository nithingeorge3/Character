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
    var character:Character?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CharacterDetailVM(character: character)
        setUpUI()
        prepareTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.presentTransparentNavigationBar()
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
        var cell:UITableViewCell = UITableViewCell()
        switch indexPath.section {
        case 0:
            cell = indexPath.row == 0 ? loadProfilePhotoTableViewCell(indexPath: indexPath) : loadProfileNameTableViewCell(indexPath: indexPath)
        case 1:
            cell = loadProfileQuickStatusTableViewCell(indexPath: indexPath)
        default:
            return cell
        }
        return cell
    }
    
    // MARK: - Load Custom Cells
    func loadProfilePhotoTableViewCell(indexPath: IndexPath) -> ProfilePhotoTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfilePhotoTableViewCell", for:indexPath) as! ProfilePhotoTableViewCell
        cell.selectionStyle = .none
        cell.delegate = self
        cell.profileImageView.sd_setImage(with: viewModel.fetchCharactreImageURL(), placeholderImage: UIImage(named: "unique_Avatar.png"))
        return cell
    }
    
    func loadProfileNameTableViewCell(indexPath: IndexPath) -> ProfileNameTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileNameTableViewCell", for:indexPath) as! ProfileNameTableViewCell
        cell.selectionStyle = .none
        cell.nameLbl.attributedText = viewModel.fetchCharacterNameAndNickName()
        return cell
    }
    
    func loadProfileQuickStatusTableViewCell(indexPath: IndexPath) -> ProfileQuickStatusTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileQuickStatusTableViewCell", for:indexPath) as! ProfileQuickStatusTableViewCell
        cell.selectionStyle = .none
        cell.statusLbl.text = viewModel.fetchCharacterOccupation(index: indexPath.row)
        return cell
    }
}

// MARK: Button Actions
extension CharacterDetailVC: ProfilePhotoTableViewCellDelegate {

    func coverImageViewTappedTapped() {
    }
    
    func profileImageTapped() {
        AppRouter.showCharacterImageVC(navigationConroller: navigationController ?? UINavigationController(), character: viewModel.readSelectedCharacter())
    }
}
