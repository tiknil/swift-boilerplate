//
//  ThemeManager.swift
//
//  Created by Fabio Butti on 19/05/2020.
//  Copyright © 2020 Tiknil. All rights reserved.
//

import UIKit
import IQKeyboardManager

/**
 Questo manager ha lo scopo di permettere di variare il template grafico dell'applicazione attraverso il metodo apply.
 */
struct ThemeManager {
    // MARK: - Properties
    // MARK: Class
    static let selectedThemeKey = "SelectedTheme"
    
    
    // MARK: Public
    static var current: Theme {
        let storedTheme = UserDefaults.standard.integer(forKey: selectedThemeKey)
        return Theme(rawValue: storedTheme)!
    }
    
    // MARK: Private
    
    
    // MARK: - Methods
    // MARK: Class
    
    
    // MARK: Lifecycle
    
    
    // MARK: Public
    static func apply(theme: Theme) {
        // Aggiorno il tema selezionato in cache
        UserDefaults.standard.set(theme.rawValue, forKey: selectedThemeKey)
        UserDefaults.standard.synchronize()
        
        apply()
    }
    
    static func apply() {
        let theme = current
        
        // ⬇ Aggiornamenti UI
        IQKeyboardManager.shared().toolbarTintColor = theme.primary
        
        // UIWindow
        UIApplication.shared.delegate?.window??.tintColor = theme.primary
        
        // UILabel
        let labelProxy = UILabel.appearance()
        labelProxy.font = UIFont.regular(size: UIConstants.hPadding16)
        
        // UIButton
        let buttonProxy = UIButton.appearance()
        buttonProxy.tintColor = theme.primary
        
        // UIBarButton
        let barButtonProxy = UIBarButtonItem.appearance()
        barButtonProxy.tintColor = theme.primary
        
        // UINavigationBar
        let navProxy = UINavigationBar.appearance()
        navProxy.tintColor = .white
        navProxy.isTranslucent = false
        navProxy.barTintColor = theme.barBackground
        navProxy.shadowImage = UIImage()
        navProxy.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.regular(size: UIConstants.hPadding18),
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        let labelNavProxy = UILabel.appearance(whenContainedInInstancesOf: [UINavigationBar.self])
        labelNavProxy.font = UIFont.regular(size: UIConstants.hPadding18)
        let buttonNavProxy = UIButton.appearance(whenContainedInInstancesOf: [UINavigationBar.self])
        buttonNavProxy.tintColor = .white
    }
    
    
    // MARK: Private
    
}
