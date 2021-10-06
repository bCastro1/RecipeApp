//
//  CategoryMeals.swift
//  MealTimeApp
//
//  Created by Brendan Castro on 10/5/21.
//

import Foundation

//MARK: Meals By Category
struct CategorizedMealLibrary: Decodable {
    
    private enum CodingKeys: String, CodingKey { case meals = "meals"}
    var categoriezedMeals: [CategorizedMeal]
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        categoriezedMeals = try values.decode([CategorizedMeal].self, forKey: .meals)
    }
    
}

struct CategorizedMeal: Decodable, Comparable {
    
    var name: String
    var imageURL: String
    var id: String
    
    private enum CodingKeys: String, CodingKey{
        case name = "strMeal"
        case imageURL = "strMealThumb"
        case id = "idMeal"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        imageURL = try values.decode(String.self, forKey: .imageURL)
        id = try values.decode(String.self, forKey: .id)
    }
    
    static func < (lhs: CategorizedMeal, rhs: CategorizedMeal) -> Bool {
        return lhs.name < rhs.name
    }
}
