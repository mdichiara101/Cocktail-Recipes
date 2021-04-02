//
//  SwiftUIView.swift
//  Cocktail Recipes
//
//  Created by Michael Dichiara on 4/1/21.
//
import SwiftUI
import URLImage

struct RandomView: View {
   
    @StateObject var viewModel: ViewModel
    
    init(viewModel: ViewModel = .init()) {
        _viewModel = StateObject(wrappedValue: viewModel)
        
    }
   @State var loading_in_random = true
    
    var body: some View {
        NavigationView{
            VStack{
                
            Form{
                
                Section(header: Text("Random CockTails").foregroundColor(.black).onTapGesture{viewModel.randomize()}){
                    List(viewModel.random, id: \.strDrink) { rand in
                        NavigationLink(destination: CocktailView(drink: rand)){
                        Row(item: rand)
                        }
                        
                    }
                    
                }
                
            }
                
            }
            .onAppear{
                if(loading_in_random){
                    viewModel.randomize()
                    loading_in_random = false
                }
            }
            
            .navigationBarColor(backgroundColor: UIColor(#colorLiteral(red: 0.02538171494, green: 0.01945986624, blue: 0.3818581267, alpha: 1)), titleColor: UIColor.white)
            
            .navigationBarTitle(Text("Cocktail Check"), displayMode: .inline)
            
            
            
        }
       
        
             
        
        
        
    }
    
    
    
}

extension RandomView {
    class ViewModel: ObservableObject {
        
        @Published var random: [Drink] = []
        
        let dataService: DataService
        init(dataService: DataService = AppDataService()){
            self.dataService = dataService
        }
        
        func randomize() {
            random = []
            dataService.getRandomDrink {
                [weak self] results in
                self?.random.append(contentsOf: results)
            }
            dataService.getRandomDrink {
                [weak self] results in
                self?.random.append(contentsOf: results)
            }
            dataService.getRandomDrink {
                [weak self] results in
                self?.random.append(contentsOf: results)
            }
            
        }
        
        
    }
}
