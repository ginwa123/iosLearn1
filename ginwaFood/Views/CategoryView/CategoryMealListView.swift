//
//  CategoryFoodListView.swift
//  ginwaFood
//
//  Created by Gilang Trisetya Indrawan on 28/05/22.
//

import SwiftUI

struct CategoryMealListView: View {
    @State private var mealCategories = [CategoryRowModel?]()
    @State private var originalMealCategories = [CategoryRowModel?]()
    @State private var isLoading = true
    @State private var isShowAlertError = false
    @State private var errorMessage = ""
    
    var body: some View {
        ZStack {
            VStack {
                GSearchBarView { searchText in
                    self.mealCategories = self.originalMealCategories.filter{
                        ($0?.strCategory?.hasPrefix(searchText))!
                    }
                }
                
                List(mealCategories, id: \.?.id) { rowModel in
                    NavigationLink {
                        MealListByCategoryView(rowModel: rowModel)
                    } label: {
                        CategoryMealRowView(rowModel: rowModel)
                    }
                }
                .onAppear(perform: {
                    Task {
                        await loadData()
                    }
                })
                .navigationTitle("Category")
                .navigationBarTitleDisplayMode(.inline)
            }
           
            
            if mealCategories.isEmpty && !isLoading {
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
    
    private func loadData() async{
        do {
            guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php")
            else {
                throw GError.FatalError("InvalidUrl")
            }
            let urlRequest = URLRequest(url: url)
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard (response as? HTTPURLResponse)?.statusCode == 200
            else {
                throw GError.FatalError("Error while fetching data")
            }
            let decoded = try JSONDecoder().decode(CategoryModel.self, from: data)
            self.originalMealCategories = decoded.categories.sorted {
                $0?.strCategory ?? "" < $1?.strCategory ?? ""
            }
            self.mealCategories = self.originalMealCategories
            
            
           
        }catch {
            self.isShowAlertError = true
            self.errorMessage = "\(error)"
        }
        self.isLoading = false
    }
}

struct CategoryMealListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryMealListView()
    }
}
