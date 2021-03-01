//
//  Helper.swift
//  Character
//
//  Created by Nitin George on 24/02/2021.
//

import Foundation
import UIKit

class Helper: NSObject {
    class func KeyWindow() -> UIWindow? {
        // getting access to the window object from SceneDelegate
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
          let sceneDelegate = windowScene.delegate as? SceneDelegate
        else {
          return nil
        }
        return sceneDelegate.window
    }
    
    class func statusBarHeight() -> CGFloat {
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        return window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    }
    
    class func getAppearanceValue(apperanceID: Int) -> String {
        switch apperanceID {
        case Appearance.season1.getID():  return{NSLocalizedString("season1", comment: "")}()
        case Appearance.season2.getID():  return{NSLocalizedString("season2", comment: "")}()
        case Appearance.season3.getID():  return{NSLocalizedString("season3", comment: "")}()
        case Appearance.season4.getID():  return{NSLocalizedString("season4", comment: "")}()
        case Appearance.season5.getID():  return{NSLocalizedString("season5", comment: "")}()
        case Appearance.season6.getID():  return{NSLocalizedString("season6", comment: "")}()
        case Appearance.season7.getID():  return{NSLocalizedString("season7", comment: "")}()
        case Appearance.season8.getID():  return{NSLocalizedString("season8", comment: "")}()
        case Appearance.season9.getID():  return{NSLocalizedString("season9", comment: "")}()
        case Appearance.season10.getID(): return{NSLocalizedString("season10", comment: "")}()
        default:
            return ""
        }
    }
}
