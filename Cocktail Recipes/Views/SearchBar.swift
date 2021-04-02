//
//  SwiftUIView.swift
//  Cocktail Recipes
//
//  Created by Michael Dichiara on 4/1/21.
//

import SwiftUI

struct SearchBar: View {
    let results: [Drink]
    @State  var searchText = ""
    @State  var showCancelButton: Bool = false
     @State var items = [Drink]()
    var body: some View {
        NavigationView{
            VStack {
                // Search view
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")

                        TextField("search by name or ingredient", text: $searchText, onEditingChanged: { isEditing in
                            self.showCancelButton = true
                        }, onCommit: {
                            items = []
                            for item in results {
                                let s = [item.strIngredient1, item.strIngredient2, item.strIngredient3, item.strIngredient4, item.strIngredient5, item.strIngredient6, item.strIngredient7, item.strIngredient8, item.strIngredient9, item.strIngredient10, item.strIngredient11, item.strIngredient12, item.strIngredient13, item.strIngredient14, item.strIngredient15]
                                var i = 0
                                while(i < 15) {
                                    
                                    if(s[i] != nil && s[i]!.contains(searchText) || item.strDrink.contains(searchText)){
                                        
                                        if(!items.contains(item)){
                                            items.append(item)
                                            
                                        }
                                    }
                                    
                                    i += 1
                                }
                                
                                
                            }
                            
                        }).foregroundColor(.primary)

                        Button(action: {
                            self.searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                        }
                    }
                    .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                    .foregroundColor(.secondary)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10.0)

                    if showCancelButton  {
                        Button("Cancel") {
                                UIApplication.shared.endEditing(true) // this must be placed before the other commands here
                            self.searchText = ""
                            self.showCancelButton = false
                        }
                        .foregroundColor(Color(.systemBlue))
                    }
                }
                .padding(.horizontal)
                .navigationBarHidden(showCancelButton) // .animation(.default) // animation does not work properly

                List(items, id: \.strDrink) { item in
                    NavigationLink(destination: CocktailView(drink: item)){
                    Row(item: item)
                    }
                    
                    
                }
                .navigationBarTitle(Text("Search"), displayMode: .inline)
                .navigationBarColor(backgroundColor: UIColor(#colorLiteral(red: 0.02538171494, green: 0.01945986624, blue: 0.3818581267, alpha: 1)), titleColor: UIColor.white)
                
                .resignKeyboardOnDragGesture()
                
            }
            
        }
            
        
    }
    
    
}




