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
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate let cellComponentPadding: CGFloat = 8
    
    
    //MARK: UI component inits
    let categoryImage: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var categoryTitle: UILabel = {
        var label = UILabel.standard(withText: "")
        label.font = .subtitleFont()
        label.minimumScaleFactor = 0.6
        label.textAlignment = .center
        return label
    }()
    
    
    
    //MARK: constraint setup
    func setupCell(){
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.dynamicText().cgColor
        self.layer.borderWidth = 1
        
        self.addSubview(categoryImage)
        categoryImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: cellComponentPadding).isActive = true
        categoryImage.topAnchor.constraint(equalTo: self.topAnchor, constant: cellComponentPadding).isActive = true
        categoryImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -1*cellComponentPadding).isActive = true
        categoryImage.heightAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        self.addSubview(categoryTitle)
        categoryTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: cellComponentPadding).isActive = true
        categoryTitle.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -1*cellComponentPadding).isActive = true
        categoryTitle.topAnchor.constraint(equalTo: self.categoryImage.bottomAnchor, constant: cellComponentPadding).isActive = true
        categoryTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -1*cellComponentPadding).isActive = true
    }
}
