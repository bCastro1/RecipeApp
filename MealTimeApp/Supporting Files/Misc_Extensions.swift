//
//  Misc_Extensions.swift
//  MealTimeApp
//
//  Created by Brendan Castro on 10/6/21.
//

import Foundation
import UIKit


//MARK: optionl extension
extension Optional where Wrapped == String {
    
    //quickly unwraps optional with simple function. used to clean up code in controllers
    func unwrapSafely() -> String {
        if let value = self {
            return value
        }
        return ""
    }
}


//MARK: scroll view extension
extension UIScrollView {
    //used for returning dynamic content view size for scroll view
    //gets size of all subviews in scrollview, sets content size variable in a scroll view.
    func resizeScrollViewToFitContentSize() {
        var contentRect = CGRect.zero
        for view in self.subviews {
            contentRect = contentRect.union(view.frame)
        }
        self.contentSize = contentRect.size
    }
}


//MARK: navigation bar extension
extension UINavigationController {
    //helper funciton to quickly change the backgroudn color of the status bar. extra steps for some deprication
    func setStatusBar(backgroundColor: UIColor) {
        let statusBarFrame: CGRect
        if #available(iOS 13.0, *) {
            statusBarFrame = view.window?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero
        } else {
            statusBarFrame = UIApplication.shared.statusBarFrame
        }
        let statusBarView = UIView(frame: statusBarFrame)
        statusBarView.backgroundColor = backgroundColor
        view.addSubview(statusBarView)
    }
}
