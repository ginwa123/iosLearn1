//
//  IngredientMealListView.swift
//  ginwaFood
//
//  Created by Gilang Trisetya Indrawan on 28/05/22.
//

import SwiftUI

struct IngredientMealListView: View {
    @State private var isLoading = true
    @State private var originalMealIngredients = [IngredientRowModel?]()
    @State private var mealIngredients = [IngredientRowModel?]()
    @State private var isShowAlertError = false
    @State private var errorMessage = ""
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                GSearchBarView { searchText in
                    self.mealIngredients = self.originalMealIngredients.filter {
                        ($0?.strIngredient?.hasPrefix(searchText))!
                    }
                }
                
                List(mealIngredients, id: \.?.id) { rowModel in
                    NavigationLink {
                        MealListByIngredientView(rowModel: rowModel)
                    } label: {
                        IngredientMealRowView(rowModel: rowModel)
                    }
                }
                
            }
            
            .onAppear(perform: {
                Task {
                    await loadData()
                }
            })
            .navigationTitle("Ingredients")
            .navigationBarTitleDisplayMode(.inline)
            
            
            if mealIngredients.isEmpty && !isLoading {
                GDataNotFoundView()
            }
            
            if isLoading {
                GLoadingView()
            }
        }
        .alert(isPresented: $isShowAlertError) {
            Alert(title: Text("Error"),
                  message: Text(self.errorMessage))
        }
    }
    
    private func loadData() async {
        do {
            guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/list.php?i=list")
            else {
                throw GError.FatalError("InvalidUrl")
            }
            let urlRequest = URLRequest(url: url)
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard (response as? HTTPURLResponse)?.statusCode == 200
            else {
                throw GError.FatalError("Error while fetching data")
            }
            let decoded = try JSONDecoder().decode(IngredientModel.self, from: data)
            self.originalMealIngredients = decoded.meals.sorted {
                $0?.strIngredient ?? "" < $1?.strIngredient ?? ""
            }
            self.mealIngredients = self.originalMealIngredients
            
        } catch  {
            self.isShowAlertError = true
            self.errorMessage = "\(error)"
        }
        
        self.isLoading  = false
        
    }
}

struct IngredientMealListView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientMealListView()
    }
}
