//
//  CocktailView.swift
//  Cocktail Recipes
//
//  Created by Michael Dichiara on 4/1/21.
//

import SwiftUI
import URLImage

struct CocktailView: View {
   
    var drink: Drink
    var ingredients: [String?] {
        var f: [String?] = []
        let m: [String?] = [drink.strMeasure1, drink.strMeasure2, drink.strMeasure3, drink.strMeasure4, drink.strMeasure5, drink.strMeasure6, drink.strMeasure7, drink.strMeasure8, drink.strMeasure9, drink.strMeasure10, drink.strMeasure11, drink.strMeasure12, drink.strMeasure13, drink.strMeasure14, drink.strMeasure15]
        let s: [String?] = [drink.strIngredient1, drink.strIngredient2, drink.strIngredient3, drink.strIngredient4, drink.strIngredient5, drink.strIngredient6, drink.strIngredient7, drink.strIngredient8, drink.strIngredient9, drink.strIngredient10, drink.strIngredient11, drink.strIngredient12, drink.strIngredient13, drink.strIngredient14, drink.strIngredient15]
        var i = 0
        while(i < 15) {
            if(s[i] != nil){
                f += ["\(s[i] ?? ""): \(m[i] ?? "Desired Amount")"]
            }
            
            i+=1
        }
        return f
    }
    var body: some View {
        VStack{
            URLImage(url: URL(string: "\(drink.strDrinkThumb)")!,
                    content: { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    })
            
            Text(drink.strCategory)
                .font(.subheadline)
            Form{
                
                Section(header: Text("Ingredients")){
                    List(ingredients, id: \.self){
                        ingredient in
                        Text("\(ingredient!)")
                    }
                    
                }
                
                Section(header: Text("Instructions")){
                    Text("\(drink.strInstructions)")
                }
                
                
                
            }
    
                
            
            
            
            
        } .navigationBarTitle(drink.strDrink, displayMode: .inline)
    
        
    }
}


