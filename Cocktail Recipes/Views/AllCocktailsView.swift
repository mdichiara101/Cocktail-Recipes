//
//  AllCocktailsView.swift
//  Cocktail Recipes
//
//  Created by Michael Dichiara on 4/1/21.
//

import SwiftUI

struct AllCocktailsView: View {
    var results: [Drink]
    
    var body: some View {
        NavigationView{
            List(results.sorted(), id: \.strDrink) { result in
                NavigationLink(destination: CocktailView(drink:  result)){
                Row(item: result)
                }
        }
        .navigationBarTitle(Text("All Cocktails"), displayMode: .inline)
        .navigationBarColor(backgroundColor: UIColor(#colorLiteral(red: 0.02538171494, green: 0.01945986624, blue: 0.3818581267, alpha: 1)), titleColor: UIColor.white)
        
        }
        
    }
}





