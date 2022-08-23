//
//  Navigator.swift
//  News
//
//  Created by Abdullah on 23/08/2022.
//

import Foundation
import UIKit

enum Navigation {
    case push(UIViewController)
    case pop
}

class Navigator {
    func navigate(with navigation: Navigation, animated: Bool = false) {
        switch navigation {
        case .push(let vc):
            currentNavigationController()?.pushViewController(vc,animated: animated)
        case .pop:
            currentNavigationController()?.popViewController(animated: animated)
        }
    }
}

extension Navigator {
    
    func topMostViewController() -> UIViewController? {
        UIWindow.keyWindow?.rootViewController?.presentedViewController
    }
    
    func currentNavigationController() -> UINavigationController? {
        UIWindow.keyWindow?.rootViewController as? UINavigationController
    }
}
