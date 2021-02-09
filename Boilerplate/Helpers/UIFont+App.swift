//
//  UIFont+App.swift
//
//  Created by Fabio Butti on 11/05/2020.
//  Copyright © 2020 Tiknil. All rights reserved.
//

import UIKit

extension UIFont {
    // MARK: - Styles
    
    class func regular(size: CGFloat) -> UIFont {
        return .systemFont(ofSize: size)
    }
    class func italic(size: CGFloat) -> UIFont {
        return .italicSystemFont(ofSize: size)
    }
    
    class func bold(size: CGFloat) -> UIFont {
        return .boldSystemFont(ofSize: size)
    }
}
