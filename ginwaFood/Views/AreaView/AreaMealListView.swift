//
//  AreaMealListView.swift
//  ginwaFood
//
//  Created by Gilang Trisetya Indrawan on 28/05/22.
//

import SwiftUI

struct AreaMealListView: View {
    @State private var mealAreas = [AreaRowModel?]()
    @State private var originalMealAreas = [AreaRowModel?]()
    @State private var isLoading = true
    @State private var isShowAlertError = false
    @State private var errorMessage = ""
    
    var body: some View {
        ZStack {
            VStack {
                GSearchBarView { searchText in
                    self.mealAreas = self.originalMealAreas.filter{
                        ($0?.strArea?.hasPrefix(searchText))!
                    }
                }
                List(mealAreas, id: \.?.id) { rowModel in
                    NavigationLink {
                        MealListByAreaView(rowModel: rowModel)
                    } label: {
                        AreaMealRowView(rowModel: rowModel)
                    }
                }
                .onAppear(perform: {
                    Task {
                        await loadData()
                    }
                })
                .navigationTitle("Areas")
                .navigationBarTitleDisplayMode(.inline)
            }
           
            
            if mealAreas.isEmpty && !isLoading {
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
            guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/list.php?a=list")
            else {
                throw GError.FatalError("InvalidUrl")
            }
            let urlRequest = URLRequest(url: url)
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard (response as? HTTPURLResponse)?.statusCode == 200
            else {
                throw GError.FatalError("Error while fetching data")
            }
            let decoded = try JSONDecoder().decode(AreaModel.self, from: data)
            self.mealAreas = decoded.meals.sorted {
                $0?.strArea ?? "" < $1?.strArea ?? ""
            }
            self.originalMealAreas = self.mealAreas
        }catch {
            self.isShowAlertError = true
            self.errorMessage = "\(error)"
        }
        self.isLoading = false
    }
    
}

struct AreaMealListView_Previews: PreviewProvider {
    static var previews: some View {
        AreaMealListView()
    }
}
