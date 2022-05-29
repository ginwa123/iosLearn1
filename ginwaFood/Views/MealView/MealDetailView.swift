//
//  MealDetailView.swift
//  ginwaFood
//
//  Created by Gilang Trisetya Indrawan on 28/05/22.
//

import SwiftUI

struct MealDetailView: View {
    let rowModel: MealRowModel?
    @State var meal: Meal? = nil
    @State private var isLoading = true
    @State private var showView = false
    @State private var isDisplayMealListByCategory = false
    @State private var isDisplayMealListByArea = false
    @State private var isShowAlertError = false
    @State private var errorMessage = ""
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 8) {
                    AsyncImage(url: URL(string: meal?.strMealThumb ?? "")) { phase in
                        if let image = phase.image {
                            image.resizable() // Displays the loaded image.
                        } else if phase.error != nil {
                            Image("noImage").resizable()
                        } else {
                            ProgressView() // Acts as a placeholder.
                        }
                    }
                    .frame(width: 300, height: 300)
                    .cornerRadius(20)
                    .aspectRatio(contentMode: .fit)
                    
                    
                    HStack {
                        Text("Category")
                        Spacer()
                        Text(meal?.strCategory ?? "-")
                            .onTapGesture {
                                isDisplayMealListByCategory.toggle()
                            }
                            .foregroundColor(.blue)
                    }
                    
                    HStack {
                        Text("Area")
                        Spacer()
                        Text(meal?.strArea ?? "-")
                            .onTapGesture {
                                isDisplayMealListByArea.toggle()
                            }
                            .foregroundColor(.blue)
                    }
                    MealIngredientView(meal: meal)
                    
                    HStack {
                        Text("Instruction")
                            .bold()
                            .font(.title)
                            .underline()
                    }
                    Divider()
                    HStack {
                        Text(meal?.strInstructions ?? "")
                    }
                    HStack {
                        Text("Youtube :")
                        Text(meal?.strYoutube ?? "-")
                            .underline()
                            .onTapGesture {
                                let url = URL.init(string: meal?.strYoutube ?? "")
                                guard let stackOverflowURL = url, UIApplication.shared.canOpenURL(stackOverflowURL) else { return }
                                UIApplication.shared.open(stackOverflowURL)
                            }
                            .foregroundColor(.blue)
                        Spacer()
                    }
                }
            }
            .padding()
            .onAppear(perform: {
                Task {
                    await loadData()
                }
            })
            .navigationBarTitle(meal?.strMeal ?? "", displayMode: .automatic)
            
            if isLoading {
                GLoadingView()
            }
            
            let categoryRowModel = CategoryRowModel(
                idCategory: "",
                strCategory: meal?.strCategory,
                strCategoryThumb: "",
                strCategoryDescription: ""
            )
            NavigationLink(destination: MealListByCategoryView(rowModel: categoryRowModel),
                           isActive: $isDisplayMealListByCategory,
                           label: {
                Text("")
            })
            .hidden()
            
            let areaRowModel = AreaRowModel(
                strArea: meal?.strArea
            )
            NavigationLink(destination: MealListByAreaView(rowModel: areaRowModel),
                           isActive: $isDisplayMealListByArea,
                           label: {
                Text("")
            })
            .hidden()
        }
        .alert(isPresented: $isShowAlertError) {
            Alert(title: Text("Error"),
                  message: Text(self.errorMessage))
        }
        
    }
    
    private func loadData() async {
        do {
            guard let url = URL(
                string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=" + (rowModel?.idMeal ?? ""))
            else {
                throw GError.FatalError("InvalidUrl")
            }
            let urlRequest = URLRequest(url: url)
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard (response as? HTTPURLResponse)?.statusCode == 200
            else {
                throw GError.FatalError("Error while fetching data")
            }
            let decoded = try JSONDecoder().decode(MealDetailModel.self, from: data)
            self.meal = decoded.meals[0]
            
        } catch  {
            self.isShowAlertError = true
            self.errorMessage = "\(error)"
        }
        
        self.isLoading  = false
        
    }

}

struct PushedView: View {
    var body: some View {
        Text("This is your pushed view...")
            .font(.largeTitle)
            .fontWeight(.heavy)
    }
}


struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailView(
            rowModel: MealRowModel(
                strMeal: "beef",
                strMealThumb: "beef",
                idMeal: "52772"),meal: Meal(idMeal: "1", strMeal: "Padang", strDrinkAlternate: "Boba", strCategory: "Beef", strArea: "Japanese", strInstructions: "bake 35 minutes or until cooked through. Remove from oven and shred chicken in the dish using two forks.\r\n*Meanwhile, steam or cook the vegetables according to package directions.\r\nAdd the cooked vegetables and rice to the casserole dish with the chicken. Add most of the remaining sauce, reserving a bit to drizzle over the top when serving. Gently toss everything together in the casserole dish until combined. Return to oven and cook 15 minutes. Remove from oven and let stand 5 minutes before serving. Drizzle each serving with remaining sauce. Enjoy!", strMealThumb: "beef", strTags: "tags", strYoutube: "youtube", strIngredient1: "ingredient1", strIngredient2: "ingredient2", strIngredient3: "", strIngredient4: "ingredient2", strIngredient5: "ingredient2", strIngredient6: "ingredient2", strIngredient7: "ingredient2", strIngredient8: "ingredient2", strIngredient9: "ingredient2", strIngredient10: "ingredient2", strIngredient11: "ingredient2", strIngredient12: "ingredient2", strIngredient13: "ingredient2", strIngredient14: "ingredient2", strIngredient15: "ingredient2", strIngredient16: "ingredient2", strIngredient17: "ingredient2", strIngredient18: "ingredient2", strIngredient19: "ingredient2", strIngredient20: "ingredient2", strMeasure1: "measure", strMeasure2: "measure", strMeasure3: "fdsadsad", strMeasure4: "measure", strMeasure5: "measure", strMeasure6: "measure", strMeasure7: "measure", strMeasure8: "measure", strMeasure9: "measure", strMeasure10: "measure", strMeasure11: "measure", strMeasure12: "measure", strMeasure13: "measure", strMeasure14: "measure", strMeasure15: "measure", strMeasure16: "measure", strMeasure17: "measure", strMeasure18: "measure", strMeasure19: "measure", strMeasure20: "measure", strSource: "soruce", strImageSource: "image source", strCreativeCommonsConfirmed: "measure", dateModified: "date"))
    }
}
