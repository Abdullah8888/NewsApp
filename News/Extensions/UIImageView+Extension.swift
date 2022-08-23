//
//  UIImageView+Extension.swift
//  News
//
//  Created by Abdullah on 23/08/2022.
//

import Foundation
import UIKit
import SDWebImage

extension UIImageView {
    func showImage(url: String, placeholderImage: UIImage? = UIImage(named: "placeholder")) {
        clipsToBounds = true
        self.changeImageColor(to: .white)
        backgroundColor = .black
        showLoader(on: self)
        sd_setImage(with: URL(string: url), placeholderImage: placeholderImage) { img, err, _, _ in
            if err != nil {
                self.image = placeholderImage
                self.changeImageColor(to: .lightGray)
            }
            else {
                self.image = img
            }
            self.hideLoader(on: self)
        }
    }
    
    func changeImageColor(to color: UIColor) {
        image = image?.withRenderingMode(.alwaysTemplate)
        tintColor = color
    }
}
