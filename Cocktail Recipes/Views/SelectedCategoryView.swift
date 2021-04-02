//
//  SelectedCategoryView.swift
//  Cocktail Recipes
//
//  Created by Michael Dichiara on 4/1/21.
//
import SwiftUI

struct SelectedCategory: View{

    var results: [Drink]
    var category: String
    var category_results: [Drink] {
        var cat: [Drink] = []
        
        for result in results {
            if(result.strCategory.elementsEqual(category) && !cat.contains(result)) {
                cat.append(result)
            }
        }
        return cat
    }
    
    var body: some View {
        List(category_results.sorted(), id: \.strDrink) { result in
            NavigationLink(destination: CocktailView(drink: result)){
            Row(item: result)
            }
    }
        .navigationBarTitle(Text(category), displayMode: .inline)
        
        
        
}
}


