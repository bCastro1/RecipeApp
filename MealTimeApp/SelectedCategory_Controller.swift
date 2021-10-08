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
    private var featuredMeal : CategorizedMeal?
    
    var selectedCategory: Category? = nil {
        didSet {
            Task {
                do {
                    guard let categoryName = selectedCategory?.name else {return}
                    try categoryMealLibrary = await fetchMeals(withCategoryID: categoryName)
                    guard let meals = categoryMealLibrary?.categoriezedMeals else {return}
                    self.categoryMeals = meals.sorted()
                    featuredMeal = categoryMeals.randomElement()
                    self._view.collectionView.reloadData()
                } catch {
                    print("error: \(error)")
                }
            }
        }
    }
    
    var _view = SelectedCategory_View()
    var categoryCellID = "categorizedMealCellIdentifier"
    var headerCellID = "categorizedMealHeaderCellIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _view = SelectedCategory_View(frame: self.view.frame)
        self.view = _view
        self._view.collectionView.delegate = self
        self._view.collectionView.dataSource = self
        self._view.collectionView.register(SelectedCategory_CollectionViewCell.self, forCellWithReuseIdentifier: categoryCellID)

        self._view.collectionView.register(FeaturedHeader_CollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerCellID)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setStatusBar(backgroundColor: .systemBackground)
        self.navigationController?.navigationBar.backgroundColor = .systemBackground
        self.navigationController?.setNavigationBarHidden(false, animated: false)
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









//MARK: collection view stubs
extension SelectedCategory_Controller : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.categoryMeals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = _view.collectionView.dequeueReusableCell(withReuseIdentifier: categoryCellID, for: indexPath) as! SelectedCategory_CollectionViewCell
        cell.mealTitle.text = categoryMeals[indexPath.row].name
        return cell
    }

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mealDetailVC = MealDetail_Controller()
        mealDetailVC.selectedMealID = categoryMeals[indexPath.row].id
        self.navigationController?.pushViewController(mealDetailVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerCell = self._view.collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerCellID, for: indexPath) as! FeaturedHeader_CollectionViewCell

            headerCell.featuredMealImage.loadImageWithURL(featuredMeal?.imageURL)
            headerCell.mealTitle.text = featuredMeal?.name
            headerCell.isUserInteractionEnabled = true
            headerCell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(featuredMealTileTapped)))
            headerCell.resultsLabel.text = "\(categoryMeals.count) Results"
            return headerCell
        default:
            assert(false, "Unexpected element kind")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {

        let size = CGSize(width: self._view.collectionView.frame.width, height: 300)
        
        return size
    }
    
    
    @objc func featuredMealTileTapped(){
        let mealDetailVC = MealDetail_Controller()
        mealDetailVC.selectedMealID = featuredMeal?.id
        self.navigationController?.pushViewController(mealDetailVC, animated: true)
    }
}
