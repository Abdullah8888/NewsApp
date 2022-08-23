//
//  UIViewController+Extension.swift
//  News
//
//  Created by Abdullah on 23/08/2022.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showNavBar(_ show: Bool = true) {
        navigationController?.isNavigationBarHidden = !show
        navigationController?.setNavigationBarHidden(!show, animated: true)
        navigationController?.navigationBar.isHidden = !show
    }
}
