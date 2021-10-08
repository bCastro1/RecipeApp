//
//  Font_Extension.swift
//  MealTimeApp
//
//  Created by Brendan Castro on 10/5/21.
//

import UIKit

extension UIFont{
    //extensions for variable text sizes used throughout the app
    static func standard() -> UIFont{
        return UIFont.systemFont(ofSize: 16)
    }
    
    static func titleFont() -> UIFont{
        return UIFont.boldSystemFont(ofSize: 40)
    }
    
    static func subtitleFont() -> UIFont{
        return UIFont.boldSystemFont(ofSize: 28)
    }
}
