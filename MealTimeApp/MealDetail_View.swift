//
//  MealDetail_View.swift
//  MealTimeApp
//
//  Created by Brendan Castro on 10/5/21.
//

import UIKit

class MealDetail_View: UIView {
    //MARK: initializations
    fileprivate let uiComponentPadding: CGFloat = 16
    var mealDetailViewHeight: CGFloat = 150
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .dynamicBackground()
        setupScrollView()
        setupViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: ui components
    
    var scrollView: UIScrollView = {
        var scrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    var mealImage: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    var mealDetailView: UIView = {
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
    
    var mealName = UILabel.standardizedLabel(fontSize: .titleFont(), withText: "")
    var countryLabel = UILabel.standardizedLabel(fontSize: .standard(), withText: "")
    var tagLabel = UILabel.standardizedLabel(fontSize: .standard(), withText: "")
    
    
    var ingredientsLabel = UILabel.standardizedLabel(fontSize: .subtitleFont(), withText: "Ingredients")

    var ingredientsText: UITextView = {
        var textView = UITextView()
        textView.sizeToFit()
        textView.font = UIFont.standard()
        textView.backgroundColor = .clear
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private var instructionsLabel = UILabel.standardizedLabel(fontSize: .subtitleFont(), withText: "Instructions")
    
    var instructionsText: UITextView = {
        var textView = UITextView()
        textView.sizeToFit()
        textView.backgroundColor = .clear
        textView.font = UIFont.standard()
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    var backgroundView: UIView = {
        var view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
}


extension MealDetail_View {
    private func setupScrollView(){
        self.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
    }
    
    private func setupMealDetailView(){
        tagLabel.numberOfLines = 1 //wrapping lines if needed
        countryLabel.numberOfLines = 0
        mealName.numberOfLines = 2
        mealName.minimumScaleFactor = 0.3
        
        scrollView.addSubview(mealDetailView)
        mealDetailView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        mealDetailView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        mealDetailView.topAnchor.constraint(equalTo: mealImage.bottomAnchor).isActive = true
        mealDetailView.heightAnchor.constraint(equalToConstant: mealDetailViewHeight).isActive = true

        mealDetailView.addSubview(mealName)
        mealName.centerXAnchor.constraint(equalTo: mealDetailView.centerXAnchor).isActive = true
        mealName.widthAnchor.constraint(equalTo: mealDetailView.widthAnchor, constant: -1*uiComponentPadding).isActive = true
        mealName.topAnchor.constraint(equalTo: mealDetailView.topAnchor, constant: uiComponentPadding).isActive = true
        mealName.heightAnchor.constraint(equalTo: mealDetailView.heightAnchor, multiplier: 0.38).isActive = true
        
        mealDetailView.addSubview(countryLabel)
        countryLabel.leftAnchor.constraint(equalTo: mealDetailView.leftAnchor, constant: uiComponentPadding).isActive = true
        countryLabel.widthAnchor.constraint(equalTo: mealDetailView.widthAnchor, constant: -1*uiComponentPadding).isActive = true
        countryLabel.topAnchor.constraint(equalTo: mealName.bottomAnchor, constant: uiComponentPadding).isActive = true

        
        mealDetailView.addSubview(tagLabel)
        tagLabel.leftAnchor.constraint(equalTo: mealDetailView.leftAnchor, constant: uiComponentPadding).isActive = true
        tagLabel.widthAnchor.constraint(equalTo: mealDetailView.widthAnchor, constant: -1*uiComponentPadding).isActive = true
        tagLabel.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: uiComponentPadding).isActive = true
        
    }
    
    private func setupViewConstraints(){
        scrollView.addSubview(mealImage)
        mealImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        mealImage.topAnchor.constraint(equalTo: self.scrollView.topAnchor).isActive = true
        mealImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        
        //creating meal detail with title, country and tags
        setupMealDetailView()
        
        scrollView.addSubview(ingredientsLabel)
        ingredientsLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        ingredientsLabel.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -1*uiComponentPadding).isActive = true
        ingredientsLabel.topAnchor.constraint(equalTo: self.mealDetailView.bottomAnchor, constant: uiComponentPadding*2).isActive = true
        
        scrollView.addSubview(ingredientsText)
        ingredientsText.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        ingredientsText.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -2*uiComponentPadding).isActive = true
        ingredientsText.topAnchor.constraint(equalTo: ingredientsLabel.bottomAnchor, constant: uiComponentPadding).isActive = true

        scrollView.addSubview(instructionsLabel)
        instructionsLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        instructionsLabel.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -1*uiComponentPadding).isActive = true
        instructionsLabel.topAnchor.constraint(equalTo: self.ingredientsText.bottomAnchor, constant: uiComponentPadding*2).isActive = true
        
        scrollView.addSubview(instructionsText)
        instructionsText.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        instructionsText.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -2*uiComponentPadding).isActive = true
        instructionsText.topAnchor.constraint(equalTo: instructionsLabel.bottomAnchor, constant: uiComponentPadding).isActive = true

        self.addSubview(backgroundView)
        self.sendSubviewToBack(backgroundView)
        backgroundView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        backgroundView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: self.mealImage.topAnchor).isActive = true
        backgroundView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    }
}
