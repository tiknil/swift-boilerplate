//
//  UIConstants.swift
//
//  Created by Fabio Butti on 11/05/2020.
//  Copyright © 2020 Tiknil. All rights reserved.
//

import UIKit

class UIConstants {

    // SafeArea
    static let topSafeAreaInset: CGFloat = {
        return UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0
    }()
    
    static let bottomSafeAreaInset: CGFloat = {
        return UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
    }()
    
    // Padding
    static var vPadding2 = 2.sp.vertical.from(.iPhoneX)
    static var hPadding2 = 2.sp.horizontal.from(.iPhoneX)
    
    static var vPadding4 = 4.sp.vertical.from(.iPhoneX)
    static var hPadding4 = 4.sp.horizontal.from(.iPhoneX)
    
    static var vPadding6 = 6.sp.vertical.from(.iPhoneX)
    static var hPadding6 = 6.sp.horizontal.from(.iPhoneX)
    
    static var vPadding8 = 8.sp.vertical.from(.iPhoneX)
    static var hPadding8 = 8.sp.horizontal.from(.iPhoneX)
    
    static var vPadding10 = 10.sp.vertical.from(.iPhoneX)
    static var hPadding10 = 10.sp.horizontal.from(.iPhoneX)
    
    static var vPadding12 = 12.sp.vertical.from(.iPhoneX)
    static var hPadding12 = 12.sp.horizontal.from(.iPhoneX)
    
    static var vPadding14 = 14.sp.vertical.from(.iPhoneX)
    static var hPadding14 = 14.sp.horizontal.from(.iPhoneX)
    
    static var vPadding16 = 16.sp.vertical.from(.iPhoneX)
    static var hPadding16 = 16.sp.horizontal.from(.iPhoneX)
    
    static var vPadding18 = 18.sp.vertical.from(.iPhoneX)
    static var hPadding18 = 18.sp.horizontal.from(.iPhoneX)
    
    static var vPadding20 = 20.sp.vertical.from(.iPhoneX)
    static var hPadding20 = 20.sp.horizontal.from(.iPhoneX)
    
    static var vPadding24 = 24.sp.vertical.from(.iPhoneX)
    static var hPadding24 = 24.sp.horizontal.from(.iPhoneX)
    
    static var vPadding28 = 28.sp.vertical.from(.iPhoneX)
    static var hPadding28 = 28.sp.horizontal.from(.iPhoneX)
    
    static var vPadding32 = 32.sp.vertical.from(.iPhoneX)
    static var hPadding32 = 32.sp.horizontal.from(.iPhoneX)
    
    static var vPadding38 = 38.sp.vertical.from(.iPhoneX)
    static var hPadding38 = 38.sp.horizontal.from(.iPhoneX)
    
    static var vPadding40 = 40.sp.vertical.from(.iPhoneX)
    static var hPadding40 = 40.sp.horizontal.from(.iPhoneX)
    
    static var vPadding42 = 42.sp.vertical.from(.iPhoneX)
    static var hPadding42 = 42.sp.horizontal.from(.iPhoneX)
    
    // Size
    static func h(_ size: CGFloat) -> CGFloat {
        return size.sp.horizontal.from(.iPhoneX)
    }
    static func v(_ size: CGFloat) -> CGFloat {
        return size.sp.vertical.from(.iPhoneX)
    }
    
    // Max width popup e loader
    static var maxPopupWidth = 500.sp.horizontal.from(.iPhoneX)
}
