//
//  CharacterFilterVC.swift
//  Character
//
//  Created by Nitin George on 24/02/2021.
//

import UIKit

class CharacterFilterVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    private var viewModel: CharacterFilterVMProtocol!
    weak var delegate: CharacterFilterVCDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customNavBar()
        prepareTableView()
    }
    
    func prepareModel(viewModel: CharacterFilterVM) {
        self.viewModel = viewModel
    }
    
    private func customNavBar() {
        let navItem = UINavigationItem(title: NSLocalizedString("CharacterFilterTitle", comment: ""))
        let cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: #selector(cancelButtonTouched))
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneButtonTouched))
        navItem.leftBarButtonItem  = cancelItem
        navItem.rightBarButtonItem = doneItem
        navigationBar.setItems([navItem], animated: false)
    }
    
    private func prepareTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension CharacterFilterVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}

extension CharacterFilterVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRow()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell = UITableViewCell()
        cell = loadCharacterFilterViewCell(indexPath: indexPath)
        return cell
    }
    
    // MARK: - Load Custom Cells
    func loadCharacterFilterViewCell(indexPath: IndexPath) -> CharacterFilterViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterFilterViewCell", for:indexPath) as! CharacterFilterViewCell
        cell.selectionStyle = .none
        cell.delegate = self
        cell.titleLabel.text = viewModel.fetchAppearance(index:indexPath.row)
        cell.selectionButton.tag = indexPath.row + 1
        cell.bottomSeparator.isHidden = (indexPath.row == (viewModel.numberOfRow() - 1))
        cell.selectionButton.isSelected = viewModel.fetchSelectedStatus(indexAppearanceID: viewModel.fetchFilterOptionID(index:indexPath.row))
        return cell
    }
}

// MARK: Button Actions
extension CharacterFilterVC: CharacterFilterViewCellDelegate {
    
    @objc func cancelButtonTouched() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func doneButtonTouched() {
        delegate?.doneButtonTouched(appearanceID: viewModel.fetchAllSelectedIds())
        dismiss(animated: true, completion: nil)
    }
    
    func checkMarkSelected(_ sender: UIButton) {
        viewModel.checkMarkSelected(id: sender.tag)
    }
    
    func checkMarkUnSelected(_ sender: UIButton) {
        viewModel.checkMarkUnSelected(id: sender.tag)
    }
}
