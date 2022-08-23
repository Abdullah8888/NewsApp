//
//  Constant.swift
//  News
//
//  Created by Abdullah on 23/08/2022.
//

import Foundation
import UIKit

class Constant {

    static func lightHaptic(){
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }
    
    static var screenWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    
    static var screenHeight: CGFloat {
        UIScreen.main.bounds.height
    }
    
    static var statusBarFrameHeight: CGFloat {
        if #available(iOS 13.0, *) {
            return UIWindow.keyWindow?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0
        }
        else {
            return UIApplication.shared.statusBarFrame.height
        }
    }
}
