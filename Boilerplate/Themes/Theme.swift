//
//  Theme.swift
//
//  Created by Fabio Butti on 19/05/2020.
//  Copyright © 2020 Tiknil. All rights reserved.
//

import UIKit

/**
 Questo enum elenca i possibili template grafici utilizzabili dall'app e va utilizzato attraverso il ThemeManager.
 */
enum Theme: Int {
    case blue
    
    // Colors
    var primary: UIColor {
        return .magenta
    }
    var background: UIColor {
        return .black
    }
    var lightBackground: UIColor {
        return UIColor(white: 26.0 / 255.0, alpha: 1.0)
    }
    
    var barBackground: UIColor {
        return UIColor(white: 26.0 / 255.0, alpha: 1.0)
    }
    
    /// Text
    var subtitleGrey: UIColor {
        return UIColor(white: 153.0 / 255.0, alpha: 1.0)
    }
    var text: UIColor {
        return .white
    }
    
    ///Separator
    var separatorGrey: UIColor {
        return UIColor(white: 120.0 / 255.0, alpha: 1.0)
    }
    
    /// Highleted element
    var blackHighlighted: UIColor {
        return UIColor(white: 51.0 / 255.0, alpha: 1.0)
    }

    /// SearchHeader
    var searchTextGrey: UIColor {
        return UIColor(red: 235 / 255, green: 235 / 255, blue: 245 / 255, alpha: 0.6)
    }
    var searchBorderGrey: UIColor {
        return UIColor(red: 118 / 255, green: 118 / 255, blue: 128 / 255, alpha: 1)
    }
    
    /// SegmentedControl
    var segmentedControlBackground: UIColor {
        return UIColor(red: 118 / 255, green: 118 / 255, blue: 128 / 255, alpha: 0.24)
    }
    var segmentedControlThumb: UIColor {
        return UIColor(red: 99 / 255, green: 99 / 255, blue: 102 / 255, alpha: 1)
    }
    var segmentedControlDivider: UIColor {
        return UIColor(red: 46 / 255, green: 46 / 255, blue: 48 / 255, alpha: 1)
    }
    
    /// TextField
    var textFieldBackground: UIColor {
        return UIColor(red: 118 / 255, green: 118 / 255, blue: 118 / 255, alpha: 0.24)
    }
    var textFieldBorder: UIColor {
        return UIColor(red: 51 / 255, green: 51 / 255, blue: 51 / 255, alpha: 1)
    }
    var textFieldPlaceholder: UIColor {
        return UIColor(red: 153 / 255, green: 153 / 255, blue: 153 / 255, alpha: 1)
    }
    var textFieldText: UIColor {
        return UIColor(red: 235 / 255, green: 235 / 255, blue: 235 / 255, alpha: 0.6)
    }
    var lockedTextFieldBackground: UIColor {
        return UIColor(red: 26 / 255, green: 26 / 255, blue: 26 / 255, alpha: 1)
    }
    var lockedTextFieldText: UIColor {
        return .white
    }
    var textFieldError: UIColor {
        return UIColor(red: 169 / 255, green: 31 / 255, blue: 31 / 255, alpha: 1)
    }
    
    /// List
    var cellBackground: UIColor {
        return UIColor(red: 26 / 255, green: 26 / 255, blue: 26 / 255, alpha: 1)
    }
    var cellBorder: UIColor {
        return UIColor(red: 51 / 255, green: 51 / 255, blue: 51 / 255, alpha: 1)
    }
}
