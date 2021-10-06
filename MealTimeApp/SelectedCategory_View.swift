//
//  SelectedCategory_View.swift
//  MealTimeApp
//
//  Created by Brendan Castro on 10/5/21.
//

import UIKit

class SelectedCategory_View: UIView {

    //MARK: Initializations
    fileprivate let uiComponentPadding: CGFloat = 16
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .dynamicBackground()
        setupViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

extension SelectedCategory_View {
    //MARK: setting view constraints
    func setupViewConstraints(){
        
    }
}