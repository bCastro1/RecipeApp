//
//  Meal.swift
//  MealTimeApp
//
//  Created by Brendan Castro on 10/4/21.
//

import Foundation

struct MealContainer: Decodable {
    private enum CodingKeys: String, CodingKey {
        case meals = "meals"
    }
    
    var meal: [Meal]
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        meal = try values.decode([Meal].self, forKey: .meals)
    }
}

struct Meal: Decodable, Comparable {
    
    //MARK: Meal inits
    var id: String
    var name: String
    var drinkAlternate: String?
    var category: String?
    var area: String?
    var instructions: String?
    var image_URL: String
    var tags: String?
    var youtube: String?
    
    var ingredient1: String?
    var ingredient2: String?
    var ingredient3: String?
    var ingredient4: String?
    var ingredient5: String?
    var ingredient6: String?
    var ingredient7: String?
    var ingredient8: String?
    var ingredient9: String?
    var ingredient10: String?
    var ingredient11: String?
    var ingredient12: String?
    var ingredient13: String?
    var ingredient14: String?
    var ingredient15: String?
    var ingredient16: String?
    var ingredient17: String?
    var ingredient18: String?
    var ingredient19: String?
    var ingredient20: String?
    
    var measurement1: String?
    var measurement2: String?
    var measurement3: String?
    var measurement4: String?
    var measurement5: String?
    var measurement6: String?
    var measurement7: String?
    var measurement8: String?
    var measurement9: String?
    var measurement10: String?
    var measurement11: String?
    var measurement12: String?
    var measurement13: String?
    var measurement14: String?
    var measurement15: String?
    var measurement16: String?
    var measurement17: String?
    var measurement18: String?
    var measurement19: String?
    var measurement20: String?
    
    var recipeSource: String?
    var imageSource: String?
    var creativeCommonsConfirmed: String?
    var dateModified: String?
    
    //MARK: coding keys from api
    private enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case drinkAlternate = "strDrinkAlternate"
        case category = "strCategory"
        case area = "strArea"
        case instructions = "strInstructions"
        case image_URL = "strMealThumb"
        case tags = "strTags"
        case youtube = "strYoutube"
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
        case ingredient6 = "strIngredient6"
        case ingredient7 = "strIngredient7"
        case ingredient8 = "strIngredient8"
        case ingredient9 = "strIngredient9"
        case ingredient10 = "strIngredient10"
        case ingredient11 = "strIngredient11"
        case ingredient12 = "strIngredient12"
        case ingredient13 = "strIngredient13"
        case ingredient14 = "strIngredient14"
        case ingredient15 = "strIngredient15"
        case ingredient16 = "strIngredient16"
        case ingredient17 = "strIngredient17"
        case ingredient18 = "strIngredient18"
        case ingredient19 = "strIngredient19"
        case ingredient20 = "strIngredient20"
        
        case measurement1 = "strMeasure1"
        case measurement2 = "strMeasure2"
        case measurement3 = "strMeasure3"
        case measurement4 = "strMeasure4"
        case measurement5 = "strMeasure5"
        case measurement6 = "strMeasure6"
        case measurement7 = "strMeasure7"
        case measurement8 = "strMeasure8"
        case measurement9 = "strMeasure9"
        case measurement10 = "strMeasure10"
        case measurement11 = "strMeasure11"
        case measurement12 = "strMeasure12"
        case measurement13 = "strMeasure13"
        case measurement14 = "strMeasure14"
        case measurement15 = "strMeasure15"
        case measurement16 = "strMeasure16"
        case measurement17 = "strMeasure17"
        case measurement18 = "strMeasure18"
        case measurement19 = "strMeasure19"
        case measurement20 = "strMeasure20"
        
        case recipeSource = "strSource"
        case imageSource = "strImageSource"
        case creativeCommonsConfirmed = "strCreativeCommonsConfirmed"
        case dateModified = "dateModified"
    }
    
    
    //MARK: init from decoder
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        drinkAlternate = try values.decode(String?.self, forKey: .drinkAlternate) ?? nil
        category = try values.decode(String?.self, forKey: .category) ?? nil
        area = try values.decode(String?.self, forKey: .area) ?? nil
        instructions = try values.decode(String?.self, forKey: .instructions) ?? nil
        image_URL = try values.decode(String.self, forKey: .image_URL)
        tags = try values.decode(String?.self, forKey: .tags) ?? nil
        youtube = try values.decode(String?.self, forKey: .youtube) ?? nil
        
        ingredient1 = try values.decode(String?.self, forKey: .ingredient1) ?? nil
        ingredient2 = try values.decode(String?.self, forKey: .ingredient2) ?? nil
        ingredient3 = try values.decode(String?.self, forKey: .ingredient3) ?? nil
        ingredient4 = try values.decode(String?.self, forKey: .ingredient4) ?? nil
        ingredient5 = try values.decode(String?.self, forKey: .ingredient5) ?? nil
        ingredient6 = try values.decode(String?.self, forKey: .ingredient6) ?? nil
        ingredient7 = try values.decode(String?.self, forKey: .ingredient7) ?? nil
        ingredient8 = try values.decode(String?.self, forKey: .ingredient8) ?? nil
        ingredient9 = try values.decode(String?.self, forKey: .ingredient9) ?? nil
        ingredient10 = try values.decode(String?.self, forKey: .ingredient10) ?? nil
        ingredient11 = try values.decode(String?.self, forKey: .ingredient11) ?? nil
        ingredient12 = try values.decode(String?.self, forKey: .ingredient12) ?? nil
        ingredient13 = try values.decode(String?.self, forKey: .ingredient13) ?? nil
        ingredient14 = try values.decode(String?.self, forKey: .ingredient14) ?? nil
        ingredient15 = try values.decode(String?.self, forKey: .ingredient15) ?? nil
        ingredient16 = try values.decode(String?.self, forKey: .ingredient16) ?? nil
        ingredient17 = try values.decode(String?.self, forKey: .ingredient17) ?? nil
        ingredient18 = try values.decode(String?.self, forKey: .ingredient18) ?? nil
        ingredient19 = try values.decode(String?.self, forKey: .ingredient19) ?? nil
        ingredient20 = try values.decode(String?.self, forKey: .ingredient20) ?? nil
        
        measurement1 = try values.decode(String?.self, forKey: .measurement1) ?? nil
        measurement2 = try values.decode(String?.self, forKey: .measurement2) ?? nil
        measurement3 = try values.decode(String?.self, forKey: .measurement3) ?? nil
        measurement4 = try values.decode(String?.self, forKey: .measurement4) ?? nil
        measurement5 = try values.decode(String?.self, forKey: .measurement5) ?? nil
        measurement6 = try values.decode(String?.self, forKey: .measurement6) ?? nil
        measurement7 = try values.decode(String?.self, forKey: .measurement7) ?? nil
        measurement8 = try values.decode(String?.self, forKey: .measurement8) ?? nil
        measurement9 = try values.decode(String?.self, forKey: .measurement9) ?? nil
        measurement10 = try values.decode(String?.self, forKey: .measurement10) ?? nil
        measurement11 = try values.decode(String?.self, forKey: .measurement11) ?? nil
        measurement12 = try values.decode(String?.self, forKey: .measurement12) ?? nil
        measurement13 = try values.decode(String?.self, forKey: .measurement13) ?? nil
        measurement14 = try values.decode(String?.self, forKey: .measurement14) ?? nil
        measurement15 = try values.decode(String?.self, forKey: .measurement15) ?? nil
        measurement16 = try values.decode(String?.self, forKey: .measurement16) ?? nil
        measurement17 = try values.decode(String?.self, forKey: .measurement17) ?? nil
        measurement18 = try values.decode(String?.self, forKey: .measurement18) ?? nil
        measurement19 = try values.decode(String?.self, forKey: .measurement19) ?? nil
        measurement20 = try values.decode(String?.self, forKey: .measurement20) ?? nil
        
        recipeSource = try values.decode(String?.self, forKey: .recipeSource) ?? nil
        imageSource = try values.decode(String?.self, forKey: .imageSource) ?? nil
        creativeCommonsConfirmed = try values.decode(String?.self, forKey: .creativeCommonsConfirmed) ?? nil
        dateModified = try values.decode(String?.self, forKey: .dateModified) ?? nil
        
        formatIngredientsToDictionary()
    }
  
    var ingredientsDictionary: [String:String] = [:]
    
    //MARK: Formatting ingredients
    private mutating func formatIngredientsToDictionary(){
        if let ing1 = ingredient1, let meas1 = measurement1 {
            ingredientsDictionary[meas1] = ing1
        }
        if let ing2 = ingredient2, let meas2 = measurement2 {
            ingredientsDictionary[meas2] = ing2
        }
        if let ing3 = ingredient3, let meas3 = measurement3 {
            ingredientsDictionary[meas3] = ing3
        }
        if let ing4 = ingredient4, let meas4 = measurement4 {
            ingredientsDictionary[meas4] = ing4
        }
        if let ing5 = ingredient5, let meas5 = measurement5 {
            ingredientsDictionary[meas5] = ing5
        }
        if let ing6 = ingredient6, let meas6 = measurement6 {
            ingredientsDictionary[meas6] = ing6
        }
        if let ing7 = ingredient7, let meas7 = measurement7 {
            ingredientsDictionary[meas7] = ing7
        }
        if let ing8 = ingredient8, let meas8 = measurement8 {
            ingredientsDictionary[meas8] = ing8
        }
        if let ing9 = ingredient9, let meas9 = measurement9 {
            ingredientsDictionary[meas9] = ing9
        }
        if let ing10 = ingredient10, let meas10 = measurement10 {
            ingredientsDictionary[meas10] = ing10
        }
        if let ing11 = ingredient11, let meas11 = measurement11 {
            ingredientsDictionary[meas11] = ing11
        }
        if let ing12 = ingredient12, let meas12 = measurement12 {
            ingredientsDictionary[meas12] = ing12
        }
        if let ing13 = ingredient13, let meas13 = measurement13 {
            ingredientsDictionary[meas13] = ing13
        }
        if let ing14 = ingredient14, let meas14 = measurement14 {
            ingredientsDictionary[meas14] = ing14
        }
        if let ing15 = ingredient15, let meas15 = measurement15 {
            ingredientsDictionary[meas15] = ing15
        }
        if let ing16 = ingredient16, let meas16 = measurement16 {
            ingredientsDictionary[meas16] = ing16
        }
        if let ing17 = ingredient17, let meas17 = measurement17 {
            ingredientsDictionary[meas17] = ing17
        }
        if let ing18 = ingredient18, let meas18 = measurement18 {
            ingredientsDictionary[meas18] = ing18
        }
        if let ing19 = ingredient19, let meas19 = measurement19 {
            ingredientsDictionary[meas19] = ing19
        }
        if let ing20 = ingredient20, let meas20 = measurement20 {
            ingredientsDictionary[meas20] = ing20
        }
    }
    
    //MARK: comparable stubs
    static func < (lhs: Meal, rhs: Meal) -> Bool {
        return lhs.name < rhs.name
    }
}

