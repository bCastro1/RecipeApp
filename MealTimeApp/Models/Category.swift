//
//  Category.swift
//  MealTimeApp
//
//  Created by Brendan Castro on 10/4/21.
//

import Foundation


//MARK: Category Library
struct CategoryLibrary: Decodable {
    private enum CodingKeys: String, CodingKey {case category = "categories"}
    
    var categories: [Category]
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        categories = try values.decode([Category].self, forKey: .category)
    }
}



//MARK: Category info

struct Category: Decodable {

    var id: String? //Integer in string form
    var name: String? //readable name of category
    var thumbnail_URL: String? //url to category picture
    var description: String? //description of category
    
    var meals: [Meal]?
    
    private enum CodingKeys: String, CodingKey {
        case idCategory = "idCategory"
        case strCategory = "strCategory"
        case strCategoryThumb = "strCategoryThumb"
        case strCategoryDescription = "strCategoryDescription"
    }
    
    init(id: String?, name: String?, thumbnail_URL: String?, description: String?){
        self.id = id
        self.name = name
        self.thumbnail_URL = thumbnail_URL
        self.description = description
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .idCategory)
        name = try values.decode(String.self, forKey: .strCategory)
        thumbnail_URL = try values.decode(String.self, forKey: .strCategoryThumb)
        description = try values.decode(String.self, forKey: .strCategoryDescription)
    }
}

