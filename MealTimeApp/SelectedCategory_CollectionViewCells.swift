//
//  SelectedCategory_CollectionViewCells.swift
//  MealTimeApp
//
//  Created by Brendan Castro on 10/6/21.
//

import UIKit

class SelectedCategory_CollectionViewCell: UICollectionViewCell {
    
    //MARK: cell init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate let cellComponentPadding: CGFloat = 8
    
    
    //MARK: UI component inits
    let mealTitle = UILabel.standardizedLabel(fontSize: .standard(), withText: "")
    
    
    func setupCell(){
        self.addSubview(mealTitle)
        mealTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        mealTitle.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -3*cellComponentPadding).isActive = true
        mealTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}





//MARK: featured header
class FeaturedHeader_CollectionViewCell: UICollectionReusableView {
    
    //MARK: cell init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate let cellComponentPadding: CGFloat = 8
    
    private var featuredTitle = UILabel.standardizedLabel(fontSize: .titleFont(), withText: "Featured Meal")
    
    var featuredMealImage: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var mealTitleContainer: UIView = {
        var view = UIView()
        view.backgroundColor = .black
        view.layer.masksToBounds = true
        view.layer.opacity = 0.6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var mealTitle = UILabel.standardizedLabel(fontSize: .subtitleFont(), withText: "")
    
    private var allRecipesLabel = UILabel.standardizedLabel(fontSize: .subtitleFont(), withText: "All Recipes")
    var resultsLabel = UILabel.standardizedLabel(fontSize: .standard(), withText: "")
    
    //MARK: setup constraints
    func setupCell(){
        mealTitle.textAlignment = .left
        mealTitle.textColor = .white
        resultsLabel.textAlignment = .right
        
        self.addSubview(featuredTitle)
        featuredTitle.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -2*cellComponentPadding).isActive = true
        featuredTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: cellComponentPadding).isActive = true
        featuredTitle.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        featuredTitle.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        self.addSubview(allRecipesLabel)
        allRecipesLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        allRecipesLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 2*cellComponentPadding).isActive = true
        allRecipesLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7).isActive = true
        allRecipesLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        self.addSubview(resultsLabel)
        resultsLabel.textAlignment = .right
        resultsLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        resultsLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -1*cellComponentPadding).isActive = true
        resultsLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3).isActive = true
        resultsLabel.centerYAnchor.constraint(equalTo: allRecipesLabel.centerYAnchor).isActive = true
    
        
        self.addSubview(featuredMealImage)
        featuredMealImage.topAnchor.constraint(equalTo: self.featuredTitle.bottomAnchor, constant: cellComponentPadding).isActive = true
        featuredMealImage.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -2*cellComponentPadding).isActive = true
        featuredMealImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        featuredMealImage.bottomAnchor.constraint(equalTo: self.allRecipesLabel.topAnchor, constant: -1*cellComponentPadding).isActive = true
        
        self.addSubview(mealTitle)
        mealTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        mealTitle.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -3*cellComponentPadding).isActive = true
        mealTitle.bottomAnchor.constraint(equalTo: featuredMealImage.bottomAnchor, constant: -1*cellComponentPadding).isActive = true
        
        
        self.addSubview(mealTitleContainer)
        mealTitleContainer.widthAnchor.constraint(equalTo: featuredMealImage.widthAnchor).isActive = true
        mealTitleContainer.centerXAnchor.constraint(equalTo: mealTitle.centerXAnchor).isActive = true
        mealTitleContainer.bottomAnchor.constraint(equalTo: mealTitle.bottomAnchor).isActive = true
        mealTitleContainer.heightAnchor.constraint(equalTo: mealTitle.heightAnchor, constant: cellComponentPadding).isActive = true
        
        self.sendSubviewToBack(mealTitleContainer)
        self.sendSubviewToBack(featuredMealImage)
        
        
    }
}
