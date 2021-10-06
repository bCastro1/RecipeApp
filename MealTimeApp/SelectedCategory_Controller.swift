//
//  SelectedCategory_Controller.swift
//  MealTimeApp
//
//  Created by Brendan Castro on 10/5/21.
//

import UIKit

class SelectedCategory_Controller: UIViewController {

    private var categoryMealLibrary: CategorizedMealLibrary?
    private var categoryMeals: [CategorizedMeal] = []
    
    var selectedCategory: Category? = nil {
        didSet {
            Task {
                do {
                    guard let categoryName = selectedCategory?.name else {return}
                    try categoryMealLibrary = await fetchMeals(withCategoryID: categoryName)
                    guard let meals = categoryMealLibrary?.categoriezedMeals else {return}
                    self.categoryMeals = meals.sorted()
                    print("\(categoryName) selected with \(self.categoryMeals.count) meals")
                    
                } catch {
                    print("error: \(error)")
                }
            }
        }
    }
    
    var _view = SelectedCategory_View()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _view = SelectedCategory_View(frame: self.view.frame)
        self.view = _view
        
    }
    

    enum ApiError : Error {
        case invalidUrl
    }
    
    //MARK: fetching meals in category
    func fetchMeals(withCategoryID: String) async throws -> CategorizedMealLibrary {
        guard let categoriesURL = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(withCategoryID)")
        else {throw ApiError.invalidUrl}

        let (data, _) = try await URLSession.shared.data(from: categoriesURL)
        return try JSONDecoder().decode(CategorizedMealLibrary.self, from: data)
    }

}
