//
//  MealDetail_Controller.swift
//  MealTimeApp
//
//  Created by Brendan Castro on 10/5/21.
//

import UIKit

class MealDetail_Controller: UIViewController, UIScrollViewDelegate {

    //MARK: initializations
    private var mealContainer: MealContainer?
    private var meal: Meal?
    
    var selectedMealID: String? = nil {
        didSet {
            Task {
                do {
                    //fetching meal with ID
                    guard let mealID = selectedMealID else {return}
                    //Making network call with mealID
                    try mealContainer = await fetchMeal(withID: mealID)
                    
                    //once network call comes back, mealContainer class is populated
                    guard let meal = mealContainer?.meal else {return}
                    self.meal = meal.first
                    DispatchQueue.main.async {
                        //setting UI details. updating main thread once data fetched
                        self.setMealDetails()
                    }
                } catch {
                    print("error: \(error)")
                }
            }
        }
    }
    
    var _view = MealDetail_View()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _view = MealDetail_View(frame: self.view.frame)
        _view.scrollView.delegate = self
        self.view = _view
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //extension to help get the size of the scroll views subviews.
        _view.scrollView.resizeScrollViewToFitContentSize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setStatusBar(backgroundColor: .systemBackground)
        self.navigationController?.navigationBar.backgroundColor = .systemBackground
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    enum ApiError : Error {
        case invalidUrl
    }
    
    //MARK: fetching meal by mealID
    func fetchMeal(withID: String) async throws -> MealContainer {
        guard let mealURL = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(withID)")
        else {throw ApiError.invalidUrl}

        let (data, _) = try await URLSession.shared.data(from: mealURL)
        return try JSONDecoder().decode(MealContainer.self, from: data)
    }
    
    func setMealDetails(){
        if let name = meal?.name {_view.mealName.text = name}
        if let image = meal?.image_URL {_view.mealImage.loadImageWithURL(image)}
        
        if let area = meal?.area {
            _view.countryLabel.text = "Origin: \(area)"
        }
        if let tags = meal?.tags {
            _view.tagLabel.text = "Tags: \(tags)"
        }
        
        var ingredientsText = ""
        if let ingredientsDict = meal?.ingredientsDictionary {
            for (measurement,ingredient) in ingredientsDict {
                guard measurement != "", ingredient != "" else {continue}
                ingredientsText.append("\(measurement) of \(ingredient)\n")
            }
        }
        
        _view.ingredientsText.text = ingredientsText
        
        _view.instructionsText.text = meal?.instructions.unwrapSafely()
        
        if let recipeLinkUrl = meal?.recipeSource, recipeLinkUrl != "" {
            self._view.recipeLinkButton.addTarget(self, action: #selector(recipeLinkTapped(_:)), for: .touchUpInside)
            _view.setLinkLabelConstraints()
            _view.setRecipeLinkButtonConstraints()
        }
        
        if let youtubeLinkUrl = meal?.youtube, youtubeLinkUrl != "" {
            self._view.youtubeButton.addTarget(self, action: #selector(youtubeLinkTapped(_:)), for: .touchUpInside)
            _view.setLinkLabelConstraints()
            _view.setYoutubeRecipeVideoConstraints()
        }
    }
    
    //MARK: link actions
    @objc func recipeLinkTapped(_ button: UIButton){
        if let recipeLinkUrl = meal?.recipeSource, let recipeUrl = URL(string: recipeLinkUrl) {
            UIApplication.shared.open(recipeUrl, options: [:], completionHandler: nil)
        }
    }
    
    @objc func youtubeLinkTapped(_ button: UIButton){
        if let youtubeLinkUrl = meal?.youtube, let videoUrl = URL(string: youtubeLinkUrl) {
            UIApplication.shared.open(videoUrl, options: [:], completionHandler: nil)
        }
    }
    
    
    //MARK: Scroll view stub
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //disabling horizontal scrolling
        scrollView.contentOffset.x = 0
    }
    
}
