//
//  RowView.swift
//  Cocktail Check
//
//  Created by Michael Dichiara on 3/31/21.
//

import SwiftUI
import URLImage

struct Row : View {
  var item: Drink
  var body: some View {
    VStack {
         URLImage(url: URL(string: "\(item.strDrinkThumb)")!,
                 content: { image in
                     image
                         .resizable()
                         .aspectRatio(contentMode: .fit)
                 })
      VStack {
        
            Text(item.strDrink)
            .foregroundColor(Color.blue)
            .lineLimit(nil)
           // help to align the title in the left
        
            Text(item.strCategory)
                .foregroundColor(Color.gray)
          
       // Text(item.strInstructions)
        
      }
    }.padding()
    
  }
    
}
