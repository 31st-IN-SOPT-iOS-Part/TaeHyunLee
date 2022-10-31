//
//  UIView+Extension.swift
//  1st_Assignment_Basic
//
//  Created by 이태현 on 2022/10/31.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
    
    func setBackground() {
        self.backgroundColor = .white
    }
    
}
