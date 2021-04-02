//
//  Cocktail.swift
//  Cocktail Recipes
//
//  Created by Michael Dichiara on 4/1/21.
//

import Foundation



struct Drinks: Codable {
    var drinks: [Drink]
}

struct Drink: Codable, Comparable{
    static func < (lhs: Drink, rhs: Drink) -> Bool {
        return lhs.strDrink < rhs.strDrink
    }
    
    var idDrink: String
    var strDrink: String
    var strCategory: String
    var strInstructions: String
    var strDrinkThumb: String
    
    var strIngredient1: String? = nil
    var strIngredient2: String? = nil
    var strIngredient3: String? = nil
    var strIngredient4: String? = nil
    var strIngredient5: String? = nil
    var strIngredient6: String? = nil
    var strIngredient7: String? = nil
    var strIngredient8: String? = nil
    var strIngredient9: String? = nil
    var strIngredient10: String? = nil
    var strIngredient11: String? = nil
    var strIngredient12: String? = nil
    var strIngredient13: String? = nil
    var strIngredient14: String? = nil
    var strIngredient15: String? = nil
    
    var strMeasure1: String? = nil
    var strMeasure2: String? = nil
    var strMeasure3: String? = nil
    var strMeasure4: String? = nil
    var strMeasure5: String? = nil
    var strMeasure6: String? = nil
    var strMeasure7: String? = nil
    var strMeasure8: String? = nil
    var strMeasure9: String? = nil
    var strMeasure10: String? = nil
    var strMeasure11: String? = nil
    var strMeasure12: String? = nil
    var strMeasure13: String? = nil
    var strMeasure14: String? = nil
    var strMeasure15: String? = nil
    

}
