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
    private var categoryDetailView: UIView = {
        //creating shadow effect on meal detail view
        let shadowView = UIView()
        shadowView.backgroundColor = .systemBackground
        shadowView.layer.shadowColor = UIColor.lightGray.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 2)
        shadowView.layer.shadowRadius = 8.0
        shadowView.layer.shadowOpacity = 1

        let foregroundView = UIView()
        foregroundView.frame = shadowView.bounds
        foregroundView.backgroundColor = .systemBackground
        foregroundView.layer.masksToBounds = true

        shadowView.addSubview(foregroundView)
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        return shadowView
    }()
    
    private var categoriesLabel = UILabel.standardizedLabel(fontSize: .titleFont(), withText: "Categories")
    var categoryCountLabel = UILabel.standardizedLabel(fontSize: .standard(), withText: "")
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset.top = 16
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        let cellWidth = (UIScreen.main.bounds.width/2)-20
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth+10)
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
        self.addSubview(categoryDetailView)
        categoryDetailView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        categoryDetailView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        categoryDetailView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        categoryDetailView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15).isActive = true
        
        categoryDetailView.addSubview(categoriesLabel)
        categoriesLabel.widthAnchor.constraint(equalTo: categoryDetailView.widthAnchor, multiplier: 0.7).isActive = true
        categoriesLabel.leftAnchor.constraint(equalTo: categoryDetailView.leftAnchor, constant: uiComponentPadding).isActive = true
        categoriesLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: uiComponentPadding).isActive = true
        
        categoryDetailView.addSubview(categoryCountLabel)
        categoryCountLabel.textAlignment = .right
        categoryCountLabel.bottomAnchor.constraint(equalTo: self.categoriesLabel.bottomAnchor).isActive = true
        categoryCountLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -1*uiComponentPadding).isActive = true
        categoryCountLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3).isActive = true
        
        self.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: self.categoryDetailView.bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: uiComponentPadding).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -1*uiComponentPadding).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}

