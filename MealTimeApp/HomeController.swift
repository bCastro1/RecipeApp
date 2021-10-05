//
//  HomeController.swift
//  MealTimeApp
//
//  Created by Brendan Castro on 10/4/21.
//

import UIKit

final class HomeController: UIViewController {

    private var Categories: CategoryLibrary?
    var _view = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _view = HomeView(frame: self.view.frame)
        self.view = _view
        self._view.backgroundColor = .gray
        
        Task {
            do {
                try Categories = await fetchCategories()
                guard let categories = Categories?.categories else {return}
                for item in categories {
                    print("category: \(item.name)")
                }
            } catch {
                print("error: \(error)")
            }
        }
    }

    
    
    //categories likn: "https://www.themealdb.com/api/json/v1/1/categories.php"
    //meal detail link; https://www.themealdb.com/api/json/v1/1/lookup.php?i=52874
    
    enum ApiError : Error {
        case invalidUrl
    }
    
    //MARK: fetching categories
    func fetchCategories() async throws -> CategoryLibrary {
        guard let categoriesURL = URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php")
        else {throw ApiError.invalidUrl}

        let (data, _) = try await URLSession.shared.data(from: categoriesURL)
        return try JSONDecoder().decode(CategoryLibrary.self, from: data)
    }

    

}
