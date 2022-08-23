//
//  UiView+Extension.swift
//  News
//
//  Created by Abdullah on 23/08/2022.
//

import Foundation
import UIKit

extension UIView {
    
    var cornerRadius: CGFloat {
        get {
            self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
    func addDropShadow(cornerRadius: CGFloat = 10, color: UIColor = .black, opacity: Float = 0.3, offSet: CGSize =  CGSize(width: -1, height: 1), radius: CGFloat = 5, scale: Bool = true, masksToBounds: Bool = false) {
        layer.masksToBounds = masksToBounds
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        layer.cornerRadius = cornerRadius
        //layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        //layer.shouldRasterize = true
        //layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func showLoader(on view: UIView) {
        let activity = UIActivityIndicatorView.init(style: .large)
        view.addSubview(activity)
        activity.placeAtCenterOf(centerY: view.centerYAnchor, centerX: view.centerXAnchor)
        activity.startAnimating()
        activity.color = .white
    }
    
    func hideLoader(on view: UIView) {
        for el in view.subviews {
            if el.isKind(of: UIActivityIndicatorView.self) {
                let activity = el as! UIActivityIndicatorView
                activity.hidesWhenStopped = true
                activity.stopAnimating()
            }
        }
    }
}

extension UIView {
    func applyShadow(radius: CGFloat = 2, shadowOpacity: Float = 0.8, shadowOffset: CGSize = .zero, shadowColor: CGColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 0.09).cgColor){
        layer.shadowColor = shadowColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = radius
        layer.shadowOffset = shadowOffset
    }
}

