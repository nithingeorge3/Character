//
//  AppRouter.swift
//  Character
//
//  Created by Nitin George on 24/02/2021.
//

import Foundation
import UIKit

enum NavigationState {
    case start
}

final class AppRouter {
    private static var currentState: NavigationState = .start
    
    static func newState(_ state: NavigationState) {
        currentState = state
        switch state {
        case .start:
            let viewModel = CharacterListVM(apiManager: CharacterServices())
            guard let characterListVC = CharacterListVC.instantiate(with: viewModel)  else {
                return
            }
            let navController = UINavigationController(rootViewController: characterListVC)
            Helper.KeyWindow()?.rootViewController = navController
        }
        Helper.KeyWindow()?.makeKeyAndVisible()
    }

    static func pushToCharacterDetailScreen(navigationConroller :UINavigationController, character: Character?) {
        let viewModel = CharacterDetailVM(character: character)
        guard let detailVC = CharacterDetailVC.instantiate(with: viewModel, character: character) else {
            return
        }
        navigationConroller.pushViewController(detailVC,animated: true)
    }
    
    static func presentCharacterFilterView(delegate: CharacterFilterVCDelegate, appearanceList: [Int]?, selectedAppearanceID: [Int]?) {
        let viewModel = CharacterFilterVM(seasonAppearanceList: appearanceList, selectedID: selectedAppearanceID)
        guard let filterVC = CharacterFilterVC.instantiate(with: viewModel) else {
            return
        }
        filterVC.delegate = delegate
        (delegate as! CharacterListVC).present(filterVC, animated: true, completion: nil)
    }
    
    static func showCharacterImageVC(navigationConroller: UINavigationController, character: Character?) {
        let viewModel = CharacterImageVM(character: character)
        guard let imageVC = CharacterImageVC.instantiate(with: viewModel) else {
            return
        }
        navigationConroller.pushViewController(imageVC,animated: false)
    }
}



