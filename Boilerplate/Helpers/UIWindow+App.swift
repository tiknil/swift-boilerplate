//
//  UIWindow+App.swift
//  Moolti
//
//  Created by Riccardo Tribbia on 22/02/21.
//

import UIKit

extension UIWindow {
    // Estrae il ViewController attualmente visibile
    var visibleViewController: UIViewController? {
        var top = self.rootViewController
        while true {
            if let presented = top?.presentedViewController {
                top = presented
            } else if let nav = top as? UINavigationController {
                top = nav.visibleViewController
            } else if let tab = top as? UITabBarController {
                top = tab.selectedViewController
            } else {
                break
            }
        }
        return top
    }
    
    // Recupera l'AppNavigationController visibile
    var appNav: AppNavigationController? {
        var vc = visibleViewController
        var nav: AppNavigationController?
        while true {
            if let appNav = vc?.navigationController as? AppNavigationController {
                nav = appNav
                break
            } else if let presenting = vc?.presentingViewController {
                vc = presenting
            } else {
                break
            }
        }
        return nav
    }
}
