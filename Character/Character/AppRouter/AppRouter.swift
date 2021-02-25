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
            if let characterListVC = sb?.instantiateViewController(withIdentifier: "CharacterListVC") as? CharacterListVC  {
                let navController = UINavigationController(rootViewController: characterListVC)
                Helper.KeyWindow()?.rootViewController = navController
            }
        }
        Helper.KeyWindow()?.makeKeyAndVisible()
    }

    static func pushToCharacterDetailScreen(navigationConroller :UINavigationController, character: Character?) {
        if let detailVC = sb?.instantiateViewController(withIdentifier: "CharacterDetailVC") as? CharacterDetailVC, let character = character  {
            detailVC.character = character
            navigationConroller.pushViewController(detailVC,animated: true)
        }
    }
    
    static func presentCharacterFilterView(delegate: AnyObject, appearanceList: [Int]?, selectedAppearanceID: [Int]?) {
        if let filterVC = sb?.instantiateViewController(withIdentifier: "CharacterFilterVC") as? CharacterFilterVC, let appearanceList = appearanceList  {
            filterVC.delegate = (delegate as! CharacterFilterVCDelegate)
            filterVC.prepareModel(viewModel: CharacterFilterVM(seasonAppearanceList: appearanceList, selectedID: selectedAppearanceID))
            (delegate as! CharacterListVC).present(filterVC, animated: true, completion: nil)
        }
    }
    
    static func showCharacterImageVC(navigationConroller: UINavigationController, character: Character?) {
        if let imageVC = sb?.instantiateViewController(withIdentifier: "CharacterImageVC") as? CharacterImageVC, let character = character  {
            imageVC.prepareModel(viewModel: CharacterImageVM(character: character))
            navigationConroller.pushViewController(imageVC,animated: false)
        }
    }
}



