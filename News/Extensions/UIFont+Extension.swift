//
//  UIFont+Extension.swift
//  News
//
//  Created by Abdullah on 23/08/2022.
//

import Foundation
import UIKit

extension UIFont {

    static func helveticaNeueBold(size: CGFloat = 14) -> UIFont { UIFont(name: "HelveticaNeue-Bold", size: size) ?? UIFont.systemFont(ofSize: size) }
    
    static func helveticaNeueMedium(size: CGFloat = 14) -> UIFont { UIFont(name: "HelveticaNeue-Medium", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func helveticaNeueRegular(size: CGFloat = 14) -> UIFont { UIFont(name: "HelveticaNeue", size: size) ?? UIFont.systemFont(ofSize: size) }
    
}
