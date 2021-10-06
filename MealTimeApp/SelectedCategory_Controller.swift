//
//  SelectedCategory_Controller.swift
//  MealTimeApp
//
//  Created by Brendan Castro on 10/5/21.
//

import UIKit

class SelectedCategory_Controller: UIViewController {

    //MARK: initializations
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
                    self._view.tableView.reloadData()
                    
                } catch {
                    print("error: \(error)")
                }
            }
        }
    }
    
    var _view = SelectedCategory_View()
    var categoryCellID = "categorizedMealCellIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _view = SelectedCategory_View(frame: self.view.frame)
        self.view = _view
        self._view.tableView.delegate = self
        self._view.tableView.dataSource = self
        self._view.tableView.register(SelectedCategory_TableViewCell.self, forCellReuseIdentifier: categoryCellID)
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


//MARK: table view stubs
extension SelectedCategory_Controller: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categoryMeals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = _view.tableView.dequeueReusableCell(withIdentifier: categoryCellID, for: indexPath) as! SelectedCategory_TableViewCell
        cell.mealTitle.text = categoryMeals[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mealDetailVC = MealDetail_Controller()
        mealDetailVC.selectedMealID = categoryMeals[indexPath.row].id
        self.navigationController?.pushViewController(mealDetailVC, animated: true)
    }
}
