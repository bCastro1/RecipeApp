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
    
    //MARK: UI components
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset.top = 16
        layout.minimumLineSpacing = 2
        //layout.minimumInteritemSpacing = 8
        let cellWidth = (UIScreen.main.bounds.width)-16
        layout.itemSize = CGSize(width: cellWidth, height: 44)
        var collectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
}

extension SelectedCategory_View {
    //MARK: setting view constraints
    func setupViewConstraints(){
        self.addSubview(collectionView)
        
        collectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
