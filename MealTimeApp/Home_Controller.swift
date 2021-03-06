//
//  HomeController.swift
//  MealTimeApp
//
//  Created by Brendan Castro on 10/4/21.
//

import UIKit

final class Home_Controller: UIViewController {
    //MARK: initializations
    private var categoryLibrary: CategoryLibrary?
    private var categories: [Category] = []
    var _view = Home_View()
    let categoryCellID = "CategoryCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _view = Home_View(frame: self.view.frame)
        self.view = _view
        _view.collectionView.dataSource = self
        _view.collectionView.delegate = self
        _view.collectionView.register(HomeCategory_CollectionViewCell.self, forCellWithReuseIdentifier: categoryCellID)

        //network call to download categories
        Task {
            do {
                //calling async function inside of task try method
                try categoryLibrary = await fetchCategories()
                
                //once fetch categories has finished, categories gets populated
                guard let categories = categoryLibrary?.categories else {return}
                
                self.categories = categories.sorted()
                DispatchQueue.main.async {
                    self._view.categoryCountLabel.text = "\(categories.count) Results"
                }
                self._view.collectionView.reloadData()
            } catch {
                print("error: \(error)")
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    enum ApiError : Error {
        case invalidUrl
    }
    
    //MARK: fetching categories
    func fetchCategories() async throws -> CategoryLibrary {
        guard let categoriesURL = URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php")
        else {throw ApiError.invalidUrl}
        
        //get data from api link
        let (data,_) = try await URLSession.shared.data(from: categoriesURL)
        
        //decoding json into category library
        return try JSONDecoder().decode(CategoryLibrary.self, from: data)
    }
}





//MARK: collection view stubs
extension Home_Controller : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = _view.collectionView.dequeueReusableCell(withReuseIdentifier: categoryCellID, for: indexPath) as! HomeCategory_CollectionViewCell
        //populating category cells
        cell.categoryTitle.text = categories[indexPath.row].name
        cell.categoryImage.loadImageWithURL(categories[indexPath.row].thumbnail_URL)
        
        return cell
    }

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //category selected, push next view controller
        let selectedCategoryVC = SelectedCategory_Controller()
        selectedCategoryVC.selectedCategory = categories[indexPath.row]
        selectedCategoryVC.navigationItem.title = "\(categories[indexPath.row].name) Recipes"
        self.navigationController?.pushViewController(selectedCategoryVC, animated: true)
    }
}
