//
//  ColorExtensions.swift
//  MealTimeApp
//
//  Created by Brendan Castro on 10/5/21.
//

import UIKit

extension UIColor {
    
    //MARK: Dynamic background
    //for dark mode support
    static func dynamicBackground() -> UIColor {
        if #available(iOS 13.0, *) {
            return .dynamicBackgroundColor
        } else {
            return .white
        }
    }
    
    @available(iOS 13.0, *)
    //graphite color when in dark mode, pale white in light mode
    private static let dynamicBackgroundColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        switch traitCollection.userInterfaceStyle {
        case .unspecified, .light: return UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0)
        case .dark: return UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1.0)
        @unknown default:
            fatalError()
        }
    }
    
    
    
    //MARK: Dynamic text color
    static func dynamicText() -> UIColor {
        if #available(iOS 13.0, *) {
            return .dynamicTextColor
        } else {
            return .black
        }
    }
    
    @available(iOS 13.0, *)
    //opposite of dynamic BG color
    private static let dynamicTextColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
        switch traitCollection.userInterfaceStyle {
        case .unspecified, .light: return UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1.0)
        case .dark: return UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0)
        @unknown default:
            fatalError()
        }
    }
}
