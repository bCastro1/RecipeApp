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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .dynamicBackground()
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
    
    var mealName = UILabel.title(withText: "")
    
    var mealImage: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    var countryLabel = UILabel.standard(withText: "")
    var tagLabel = UILabel.standard(withText: "")
    
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

}


extension MealDetail_View {
    func setupViewConstraints(){
        tagLabel.textAlignment = .right
        tagLabel.numberOfLines = 0 //wrapping lines if needed

        
        self.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        
        tagLabel.textAlignment = .right
        
        scrollView.addSubview(mealName)
        mealName.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        mealName.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -1*uiComponentPadding).isActive = true
        mealName.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: uiComponentPadding).isActive = true
        
        scrollView.addSubview(mealImage)
        mealImage.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        mealImage.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        mealImage.topAnchor.constraint(equalTo: self.mealName.bottomAnchor, constant: uiComponentPadding).isActive = true
        mealImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        
        scrollView.addSubview(countryLabel)
        countryLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: uiComponentPadding).isActive = true
        countryLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        countryLabel.topAnchor.constraint(equalTo: self.mealImage.bottomAnchor, constant: uiComponentPadding).isActive = true
        
        scrollView.addSubview(tagLabel)
        tagLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -1*uiComponentPadding).isActive = true
        tagLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        tagLabel.topAnchor.constraint(equalTo: self.mealImage.bottomAnchor, constant: uiComponentPadding).isActive = true
        
//        contentView.addSubview(ingredientsText)
//        ingredientsText.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
//        ingredientsText.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
//        ingredientsText.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: uiComponentPadding).isActive = true

        
        scrollView.addSubview(instructionsText)
        instructionsText.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        instructionsText.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -1*uiComponentPadding).isActive = true
        instructionsText.topAnchor.constraint(equalTo: tagLabel.bottomAnchor, constant: uiComponentPadding).isActive = true

        
//        self.scrollView.addSubview(mealName)
//        mealName.leftAnchor.constraint(equalTo: self.leftAnchor, constant: uiComponentPadding).isActive = true
//        mealName.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -1*uiComponentPadding).isActive = true
//        mealName.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: uiComponentPadding).isActive = true
//        mealName.heightAnchor.constraint(equalToConstant: 55).isActive = true
//
//        self.scrollView.addSubview(mealImage)
//        mealImage.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
//        mealImage.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
//        mealImage.topAnchor.constraint(equalTo: self.mealName.bottomAnchor, constant: uiComponentPadding).isActive = true
//        mealImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
//
//        self.scrollView.addSubview(countryLabel)
//        countryLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: uiComponentPadding).isActive = true
//        countryLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
//        countryLabel.topAnchor.constraint(equalTo: self.mealImage.bottomAnchor, constant: uiComponentPadding).isActive = true
//        countryLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
//
//        self.scrollView.addSubview(tagLabel)
//        tagLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -1*uiComponentPadding).isActive = true
//        tagLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
//        tagLabel.topAnchor.constraint(equalTo: self.mealImage.bottomAnchor, constant: uiComponentPadding).isActive = true
//        tagLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
//
////        self.scrollView.addSubview(ingredientsText)
////        ingredientsText.leftAnchor.constraint(equalTo: self.leftAnchor, constant: uiComponentPadding).isActive = true
////        ingredientsText.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -1*uiComponentPadding).isActive = true
////        ingredientsText.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: uiComponentPadding).isActive = true
////        ingredientsText.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3).isActive = true
//
//        self.scrollView.addSubview(instructionsText)
//        instructionsText.leftAnchor.constraint(equalTo: self.leftAnchor, constant: uiComponentPadding).isActive = true
//        instructionsText.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -1*uiComponentPadding).isActive = true
//        instructionsText.topAnchor.constraint(equalTo: tagLabel.bottomAnchor, constant: uiComponentPadding).isActive = true
//        instructionsText.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3).isActive = true
    }
}
