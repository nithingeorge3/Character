//
//  CharacterListVC.swift
//  Character
//
//  Created by Nitin George on 24/02/2021.
//

import UIKit

class CharacterListVC: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var apiManager: APICharacterProtocol = CharacterServices()
    private var viewModel: CharacterListViewModelProtocol!
    private let itemsPerRow: CGFloat = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CharacterListVM(apiManager: apiManager)
        prepareCollectionView()
        prepareSearchBar()
        setUpUI()
        fetchCharacters()
        setCollectionLayout()
        customNavBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.presentTransparentNavigationBar()
    }

    func setCollectionLayout() {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top:0,left:0,bottom:0,right:0)
        let width = UIScreen.main.bounds.size.width/itemsPerRow - 1
        layout.itemSize = CGSize(width: width, height: width)
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        collectionView.collectionViewLayout = layout
    }
    
    private func setUpUI() {
        title = viewModel.fetchNavigationTitle()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
        tap.delegate = self
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyBoard() {
        searchBar.searchTextField.resignFirstResponder()
    }
    
    private func prepareCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.startAnimating()
        collectionView.backgroundView = activityIndicator
    }
    
    private func prepareSearchBar() {
        searchBar.delegate = self
        searchBar.placeholder = NSLocalizedString("SearchBarPlaceholder", comment: "")
    }
    
    private func customNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: NSLocalizedString("CharacterFilterTitle", comment: ""), style: .plain, target: self, action: #selector(filterButtonTouched))
    }
    
    private func fetchCharacters() {
        viewModel.fetchCharacters { [weak self] isSuccess in
            DispatchQueue.main.async {
                self?.collectionView.backgroundView = nil
                self?.collectionView.setNoContentText(to:"")
                isSuccess ? self?.collectionView.reloadData() : self?.showErrorMessage()
            }
        }
    }
    
    private func showErrorMessage() {
        collectionView.setNoContentText(to: viewModel.errorMessage())
    }
}

extension CharacterListVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItem()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let card = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterViewCell", for: indexPath) as? CharacterViewCell {
            let character = viewModel.fetchSelectedCharacter(selectedIndex: indexPath.row)
            card.prepareCell(viewModel: CharacterViewCellVM(character: character))
            return card
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCharacter = viewModel.fetchSelectedCharacter(selectedIndex: indexPath.row)
        AppRouter.pushToCharacterDetailScreen(navigationConroller: navigationController ?? UINavigationController(), character: selectedCharacter)
    }
}

extension CharacterListVC: UISearchBarDelegate {
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let resultFound = viewModel.searchCharacterByName(name: searchText)
        collectionView.setNoContentText(to:"")
        if !resultFound {
            showErrorMessage()
        }
        collectionView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.searchTextField.text = ""
        searchBar.resignFirstResponder()
    }
}

// MARK: Button Actions
extension CharacterListVC: CharacterFilterVCDelegate {
    @objc func filterButtonTouched() {
        let selectedAppearanceID = viewModel.fetchSelectedAppearanceID()
        searchBar.searchTextField.resignFirstResponder()
        AppRouter.presentCharacterFilterView(delegate: self, appearanceList: viewModel.fetchSeasonAppearanceList(), selectedAppearanceID: selectedAppearanceID)
    }
    
    func doneButtonTouched(appearanceID: [Int]?) {
        let resultFound = viewModel.fetchCharacterSeasonResult(appearanceID: appearanceID)
        collectionView.setNoContentText(to:"")
        if !resultFound {
            showErrorMessage()
        }
        collectionView.reloadData()
    }
}
    
