//
//  TabBar.swift
//  Cocktail Recipes
//
//  Created by Michael Dichiara on 4/1/21.
//

import SwiftUI

struct TabBar: View {
    
    @StateObject var viewModel: ViewModel
    
    init(viewModel: ViewModel = .init()) {
        _viewModel = StateObject(wrappedValue: viewModel)
        UITableView.appearance().backgroundColor = .clear
        UITabBar.appearance().barTintColor = UIColor(#colorLiteral(red: 0.02538171494, green: 0.01945986624, blue: 0.3818581267, alpha: 1))
    UITabBar.appearance().unselectedItemTintColor = UIColor.black

    }
    var body: some View {
        TabView{
            RandomView()   
                .tabItem{
                    Image(systemName: "paperplane")
                        
                }
                
            AllCocktailsView(results: viewModel.results)
                .tabItem{
                    Image("cocktail")
                        
                }
            CategoryView(results: viewModel.results)
                .tabItem{
                    Image("category")
                        
                }
            SearchBar(results: viewModel.results)
                .tabItem{
                    Image(systemName: "magnifyingglass")
                        
                }
            
        }
        .onAppear(perform: viewModel.getDrinks)
    }
    
    
}


extension TabBar {
    class ViewModel: ObservableObject {
        @Published var results = [Drink]()
        
        
        let dataService: DataService
        init(dataService: DataService = AppDataService()){
            self.dataService = dataService
        }
        
        func getDrinks() {
            dataService.getDrinks {
                [weak self] results in
                self?.results = results
            }
        }
        
        
        
        
        
    }
}


struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
