//
//  Label_Extension.swift
//  MealTimeApp
//
//  Created by Brendan Castro on 10/5/21.
//

import UIKit

extension UILabel {
    
    //reusable extension to quickly return labels
    static func standard(withText: String) -> UILabel {
        let label = UILabel()
        label.font = .standard()
        label.text = withText
        label.textColor = .dynamicText()
        label.sizeToFit()
        label.adjustsFontSizeToFitWidth = true
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    static func title(withText: String) -> UILabel {
        let label = UILabel()
        label.font = .titleFont()
        label.text = withText
        label.sizeToFit()
        label.textColor = .dynamicText()
        label.adjustsFontSizeToFitWidth = true
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
