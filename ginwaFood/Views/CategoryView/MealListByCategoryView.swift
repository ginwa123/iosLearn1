//
//  CategoryFoodDetailView.swift
//  ginwaFood
//
//  Created by Gilang Trisetya Indrawan on 28/05/22.
//

import SwiftUI

struct MealListByCategoryView: View {
    @State private var meals = [MealRowModel?]()
    @State private var originalMeals = [MealRowModel?]()
    @State private var isLoading = true
    @State private var isShowAlertError = false
    @State private var errorMessage = ""
    
    let rowModel: CategoryRowModel?
    var body: some View {
        ZStack {
            VStack {
                GSearchBarView { searchText in
                    self.meals = self.originalMeals.filter{
                        ($0?.strMeal?.hasPrefix(searchText))!
                    }
                }
                List(meals, id: \.?.id) { rowModel in
                    NavigationLink {
                        MealDetailView(rowModel: rowModel)
                    } label: {
                        MealRowView(rowModel: rowModel)
                    }
                }
                .onAppear(perform: {
                    Task {
                        await loadData()
                    }
                })
                .navigationTitle(rowModel?.strCategory ?? "")
            }
            
            
            if meals.isEmpty && !isLoading {
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
            let appendUrl =  (rowModel?.strCategory ?? "")
                .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            guard let url =
                    URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=" +  appendUrl)
            else {
                throw GError.FatalError("InvalidUrl")
            }
            let urlRequest = URLRequest(url: url)
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard (response as? HTTPURLResponse)?.statusCode == 200
            else {
                throw GError.FatalError("Error while fetching data")
            }
            let decoded = try JSONDecoder().decode(MealModel.self, from: data)
            self.meals = decoded.meals.sorted {
                $0?.strMeal ?? "" < $1?.strMeal ?? ""
            }
            self.originalMeals = self.meals
        }catch {
            self.isShowAlertError = true
            self.errorMessage = "\(error)"
        }
        self.isLoading = false
    }
    
    
}

struct MealListByCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        MealListByCategoryView(rowModel: CategoryRowModel(
            idCategory: "",
            strCategory: "beef",
            strCategoryThumb: "beef",
            strCategoryDescription: "Beef is good"
        ))
    }
}
