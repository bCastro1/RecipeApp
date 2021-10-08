//
//  HomeCategory_CollectionViewCell.swift
//  MealTimeApp
//
//  Created by Brendan Castro on 10/5/21.
//

import UIKit

class HomeCategory_CollectionViewCell: UICollectionViewCell {
    //MARK: cell init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate let uiComponentPadding: CGFloat = 8
    
    
    //MARK: UI component inits
    let categoryImage: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private var titleHighlightView: UIView = {
        var view = UIView()
        view.backgroundColor = .black
        view.layer.masksToBounds = true
        view.layer.opacity = 0.6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var categoryTitle = UILabel.standardizedLabel(fontSize: .subtitleFont(), withText: "")
    
    
    
    //MARK: constraint setup
    func setupCell(){
        categoryTitle.textAlignment = .center
        categoryTitle.textColor = .white
        
        // Category Image
        //L T R H
        self.addSubview(categoryImage)
        categoryImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: uiComponentPadding).isActive = true
        categoryImage.topAnchor.constraint(equalTo: self.topAnchor, constant: uiComponentPadding).isActive = true
        categoryImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -1*uiComponentPadding).isActive = true
        categoryImage.heightAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        // Category Title
        //cX W B
        self.addSubview(categoryTitle)
        categoryTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        categoryTitle.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -1*uiComponentPadding).isActive = true
        categoryTitle.bottomAnchor.constraint(equalTo: categoryImage.bottomAnchor, constant: -1*uiComponentPadding).isActive = true
             
        //Title Highlight View
        //T L R B
        self.addSubview(titleHighlightView)
        self.titleHighlightView.topAnchor.constraint(equalTo: categoryTitle.topAnchor).isActive = true
        self.titleHighlightView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.titleHighlightView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.titleHighlightView.bottomAnchor    .constraint(equalTo: self.bottomAnchor).isActive = true
        
        //correcting the order of the views
        //in order to have the category title properly highlighted
        self.sendSubviewToBack(titleHighlightView)
        self.sendSubviewToBack(categoryImage)
    }
}
