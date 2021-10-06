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
                    guard let mealID = selectedMealID else {return}
                    try mealContainer = await fetchMeal(withID: mealID)
                    guard let meal = mealContainer?.meal else {return}
                    self.meal = meal.first
                    DispatchQueue.main.async {
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
        _view.scrollView.resizeScrollViewToFitContentSize()
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
        
        if let area = meal?.area {_view.countryLabel.text = "Area of origin: \(area)"}
        if let tags = meal?.tags {_view.tagLabel.text = "Tags: \(tags)"}
        _view.instructionsText.text = meal?.instructions.unwrapSafely()
        
        
        
        
       
        
    }
}
