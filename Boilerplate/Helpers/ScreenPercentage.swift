//
//  ScreenPercentage.swift
//
//  Created by Fabio Butti on 30/07/2019.
//  Copyright © 2020 Tiknil. All rights reserved.
//

import UIKit

public extension CGFloat {
    var sp: ScreenPercentage {
        return ScreenPercentage(cgFloat: self)
    }
}

public extension Float {
    var sp: ScreenPercentage {
        return ScreenPercentage(cgFloat: CGFloat(self))
    }
}

public extension Double {
    var sp: ScreenPercentage {
        return ScreenPercentage(cgFloat: CGFloat(self))
    }
}

public extension Int {
    var sp: ScreenPercentage {
        return ScreenPercentage(cgFloat: CGFloat(self))
    }
}

public final class ScreenPercentage {
    public enum Axis {
        case horizontal
        case vertical
    }
    
    public enum DeviceFamily {
        case iPhone5
        case iPhone6
        case iPhone6Plus
        case iPhoneX
        case iPhoneXSMax
        
        public var screenSize: CGSize {
            get {
                switch self {
                case .iPhone5:
                    return CGSize(width: 320, height: 568)
                case .iPhone6:
                    return CGSize(width: 375, height: 667)
                case .iPhone6Plus:
                    return CGSize(width: 414, height: 736)
                case .iPhoneX:
                    return CGSize(width: 375, height: 812)
                case .iPhoneXSMax:
                    return CGSize(width: 414, height: 896)
                }
            }
        }
    }
    
    // MARK: - Properties
    // MARK: Class
    
    
    // MARK: Public
    public var horizontal: ScreenPercentage {
        return ScreenPercentage(cgFloat: value, axis: .horizontal)
    }
    public var vertical: ScreenPercentage {
        return ScreenPercentage(cgFloat: value, axis: .vertical)
    }
    
    
    // MARK: Private
    private let value: CGFloat
    private let axis: Axis?
    
    
    // MARK: - Methods
    // MARK: Constructors
    convenience init(cgFloat: CGFloat) {
        self.init(cgFloat: cgFloat, axis: nil)
    }
    
    init(cgFloat: CGFloat, axis: Axis?) {
        value = cgFloat
        self.axis = axis
    }
    
    
    // MARK: Public
    public func from(_ deviceFamily: DeviceFamily) -> CGFloat {
        guard let axis = axis else { fatalError("You must select an axis prepending vertical or horizontal") }
        return from(deviceFamily, on: axis)
    }
    
    public func from(_ deviceFamily: DeviceFamily, on axis: Axis) -> CGFloat {
        let referenceSizeValue = axis == .vertical ? deviceFamily.screenSize.height : deviceFamily.screenSize.width
        let percentage = value / referenceSizeValue
        let screenSizeValue = axis == .vertical ? min(UIScreen.main.bounds.height, DeviceFamily.iPhoneXSMax.screenSize.height) : min(UIScreen.main.bounds.width, DeviceFamily.iPhoneXSMax.screenSize.width)
        return percentage * screenSizeValue
    }
    
    
    // MARK: Private
}

