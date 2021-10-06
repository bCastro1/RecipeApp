//
//  Misc_Extensions.swift
//  MealTimeApp
//
//  Created by Brendan Castro on 10/6/21.
//

import Foundation
import UIKit

extension Optional where Wrapped == String {
    func unwrapSafely() -> String {
        if let value = self {
            return value
        }
        return ""
    }
}


extension UIScrollView {
    func resizeScrollViewToFitContentSize() {
        var contentRect = CGRect.zero
        for view in self.subviews {
            contentRect = contentRect.union(view.frame)
        }
        self.contentSize = contentRect.size
    }
}
