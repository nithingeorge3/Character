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
}
