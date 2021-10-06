//
//  HomeView.swift
//  MealTimeApp
//
//  Created by Brendan Castro on 10/4/21.
//

import UIKit

class Home_View: UIView {
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
    
    
    
    
    //MARK: UI Components
    private var categoriesLabel: UILabel = .title(withText: "Categories")
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        let cellWidth = (UIScreen.main.bounds.width/2)-20
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth + 60)
        var collectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
}

extension Home_View {
    
    //MARK: Constraint sets
    func setupViewConstraints(){
        self.addSubview(categoriesLabel)
        categoriesLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: uiComponentPadding).isActive = true
        categoriesLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -1*uiComponentPadding).isActive = true
        categoriesLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: uiComponentPadding).isActive = true
        categoriesLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1).isActive = true
        
        self.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: categoriesLabel.bottomAnchor, constant: uiComponentPadding).isActive = true
        collectionView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: uiComponentPadding).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -1*uiComponentPadding).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}

