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
    private var mealDetailViewHeight: CGFloat = 150
    private var urlLinkAvailable = false
    
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

    
    private var mealDetailView: UIView = {
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
    
    //label inits
    var mealName = UILabel.standardizedLabel(fontSize: .titleFont(), withText: "")
    var countryLabel = UILabel.standardizedLabel(fontSize: .standard(), withText: "")
    var tagLabel = UILabel.standardizedLabel(fontSize: .standard(), withText: "")
    private var ingredientsLabel = UILabel.standardizedLabel(fontSize: .subtitleFont(), withText: "Ingredients")

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
    
    private var linksLabel = UILabel.standardizedLabel(fontSize: .subtitleFont(), withText: "Links")
    
    var recipeLinkButton: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Open Original Recipe Link", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var youtubeButton: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Recipe Walkthrough Video", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
}






extension MealDetail_View {
    //MARK: setup scroll view
    private func setupScrollView(){
        self.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
    }
    
    //MARK: meal detail view
    private func setupMealDetailView(){
        tagLabel.numberOfLines = 1 //wrapping lines if needed
        countryLabel.numberOfLines = 1
        mealName.numberOfLines = 2 //title max 2 lines
        mealName.minimumScaleFactor = 0.3 //shrink title more to fit longer
        
        
        //Meal detail contiainer view
        // cX W T H
        scrollView.addSubview(mealDetailView)
        mealDetailView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        mealDetailView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        mealDetailView.topAnchor.constraint(equalTo: mealImage.bottomAnchor).isActive = true
        mealDetailView.heightAnchor.constraint(equalToConstant: mealDetailViewHeight).isActive = true

        //Meal name label
        // cX W T H
        mealDetailView.addSubview(mealName)
        mealName.centerXAnchor.constraint(equalTo: mealDetailView.centerXAnchor).isActive = true
        mealName.widthAnchor.constraint(equalTo: mealDetailView.widthAnchor, constant: -1*uiComponentPadding).isActive = true
        mealName.topAnchor.constraint(equalTo: mealDetailView.topAnchor, constant: uiComponentPadding).isActive = true
        mealName.heightAnchor.constraint(equalTo: mealDetailView.heightAnchor, multiplier: 0.38).isActive = true
        
        //Countery label
        // L W T - height inferred
        mealDetailView.addSubview(countryLabel)
        countryLabel.leftAnchor.constraint(equalTo: mealDetailView.leftAnchor, constant: uiComponentPadding).isActive = true
        countryLabel.widthAnchor.constraint(equalTo: mealDetailView.widthAnchor, constant: -1*uiComponentPadding).isActive = true
        countryLabel.topAnchor.constraint(equalTo: mealName.bottomAnchor, constant: uiComponentPadding).isActive = true

        //Tag label
        // L W T - height inferred
        mealDetailView.addSubview(tagLabel)
        tagLabel.leftAnchor.constraint(equalTo: mealDetailView.leftAnchor, constant: uiComponentPadding).isActive = true
        tagLabel.widthAnchor.constraint(equalTo: mealDetailView.widthAnchor, constant: -1*uiComponentPadding).isActive = true
        tagLabel.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: uiComponentPadding).isActive = true
        
    }
    
    //MARK: view constraints
    private func setupViewConstraints(){
        // Meal Image
        // cX T H
        scrollView.addSubview(mealImage)
        mealImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        mealImage.topAnchor.constraint(equalTo: self.scrollView.topAnchor).isActive = true
        mealImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        mealImage.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        //creating meal detail with title, country and tags
        setupMealDetailView()
        
        //Ingredients word label
        // cX W T
        scrollView.addSubview(ingredientsLabel)
        ingredientsLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        ingredientsLabel.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -1*uiComponentPadding).isActive = true
        ingredientsLabel.topAnchor.constraint(equalTo: self.mealDetailView.bottomAnchor, constant: uiComponentPadding*2).isActive = true
        
        // Ingredients Text view
        // cX W T
        scrollView.addSubview(ingredientsText)
        ingredientsText.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        ingredientsText.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -2*uiComponentPadding).isActive = true
        ingredientsText.topAnchor.constraint(equalTo: ingredientsLabel.bottomAnchor, constant: uiComponentPadding).isActive = true

        //Instructions word label
        // cX W T
        scrollView.addSubview(instructionsLabel)
        instructionsLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        instructionsLabel.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -1*uiComponentPadding).isActive = true
        instructionsLabel.topAnchor.constraint(equalTo: self.ingredientsText.bottomAnchor, constant: uiComponentPadding*2).isActive = true
        
        //instructions text view
        // cX W T
        scrollView.addSubview(instructionsText)
        instructionsText.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        instructionsText.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -2*uiComponentPadding).isActive = true
        instructionsText.topAnchor.constraint(equalTo: instructionsLabel.bottomAnchor, constant: uiComponentPadding).isActive = true

    }
    
    //MARK: Adding links label
    func setLinkLabelConstraints(){
        if !urlLinkAvailable {
            //adding this bool to signify the availability of the url link
            //if the link is available, the webview player constraints can anchor off of bottom
            //sometimes link not available but youtube player is
            urlLinkAvailable = true
            
            //Links Label
            // cX W T
            scrollView.addSubview(linksLabel)
            linksLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            linksLabel.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -2*uiComponentPadding).isActive = true
            linksLabel.topAnchor.constraint(equalTo: instructionsText.bottomAnchor, constant: 2*uiComponentPadding).isActive = true
        }
    }
    
    
    //MARK: recipe button constraints
    func setRecipeLinkButtonConstraints(){
        //Recipe Link Button
        // cX W T H
        scrollView.addSubview(recipeLinkButton)
        recipeLinkButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        recipeLinkButton.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -2*uiComponentPadding).isActive = true
        recipeLinkButton.topAnchor.constraint(equalTo: linksLabel.bottomAnchor, constant: uiComponentPadding).isActive = true
        recipeLinkButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    //MARK: video button setup
    func setYoutubeRecipeVideoConstraints(){
        scrollView.addSubview(youtubeButton)
        //Web View
        // cX W H T
        youtubeButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        youtubeButton.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -2*uiComponentPadding).isActive = true
        youtubeButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        if urlLinkAvailable {
            youtubeButton.topAnchor.constraint(equalTo: recipeLinkButton.bottomAnchor, constant: uiComponentPadding).isActive = true
        }
        else {
            youtubeButton.topAnchor.constraint(equalTo: linksLabel.bottomAnchor, constant: uiComponentPadding).isActive = true
        }
    }
    
}
