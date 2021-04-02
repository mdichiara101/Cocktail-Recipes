//
//  SwiftUIView.swift
//  Cocktail Recipes
//
//  Created by Michael Dichiara on 4/1/21.
//

import SwiftUI

import SwiftUI

struct CategoryView: View {
    
    
    var results: [Drink]
    var categories: [String] {
        var arr: [String] = []
        for result in results {
            
            if(!arr.contains(result.strCategory)){
                arr.append(result.strCategory)
            }
        }
        return arr
    }
    
    
    var body: some View {
        NavigationView{
        List(categories.sorted(), id: \.self) { category in
            NavigationLink(destination: SelectedCategory(results: results, category: category)){
                Text(category)
                
            }
            
        }
        .navigationBarTitle(Text("Categories"), displayMode: .inline)
        
        }
    }
    
}


