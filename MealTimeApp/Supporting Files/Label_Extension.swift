//
//  Label_Extension.swift
//  MealTimeApp
//
//  Created by Brendan Castro on 10/5/21.
//

import UIKit

extension UILabel {
    
    //reusable extension to quickly return labels with desired attributes
    static func standardizedLabel(fontSize: UIFont, withText: String) -> UILabel {
        let label = UILabel()
        label.font = fontSize
        label.text = withText
        label.minimumScaleFactor = 0.7
        label.textColor = .dynamicText()
        label.sizeToFit()
        label.adjustsFontSizeToFitWidth = true
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
