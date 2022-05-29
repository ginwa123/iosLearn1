//
//  MealIngredientView.swift
//  ginwaFood
//
//  Created by Gilang Trisetya Indrawan on 28/05/22.
//

import SwiftUI

struct MealIngredientView: View {
    
    let meal: Meal?
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Ingredients")
                    .bold()
                    .font(.title)
                    .underline()
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            Divider()

            Group {
                if !((meal?.strIngredient1?.isEmpty) ?? false) {
                    HStack {
                        Text("1.")
                        Text(meal?.strIngredient1 ?? "")
                        Spacer()
                        Text(meal?.strMeasure1 ?? "").foregroundColor(.blue)
                    }
                }
                if !((meal?.strIngredient2?.isEmpty) ?? false) {
                    HStack {
                        Text("2.")
                        Text(meal?.strIngredient2 ?? "")
                        Spacer()
                        Text(meal?.strMeasure2 ?? "").foregroundColor(.blue)
                    }
                }
                if !((meal?.strIngredient3?.isEmpty) ?? false) {
                    HStack {
                        Text("3.")
                        Text(meal?.strIngredient3 ?? "")
                        Spacer()
                        Text(meal?.strMeasure3 ?? "").foregroundColor(.blue)
                    }
                }
                if !((meal?.strIngredient4?.isEmpty) ?? false) {
                    HStack {
                        Text("4.")
                        Text(meal?.strIngredient4 ?? "")
                        Spacer()
                        Text(meal?.strMeasure4 ?? "").foregroundColor(.blue)
                    }
                }
                if !((meal?.strIngredient5?.isEmpty) ?? false){
                    HStack {
                        Text("5.")
                        Text(meal?.strIngredient5 ?? "")
                        Spacer()
                        Text(meal?.strMeasure5 ?? "").foregroundColor(.blue)
                    }
                }
                if !((meal?.strIngredient6?.isEmpty) ?? false) {
                    HStack {
                        Text("6.")
                        Text(meal?.strIngredient6 ?? "")
                        Spacer()
                        Text(meal?.strMeasure6 ?? "").foregroundColor(.blue)
                    }
                }
                if !((meal?.strIngredient7?.isEmpty) ?? false) {
                    HStack {
                        Text("7.")
                        Text(meal?.strIngredient7 ?? "")
                        Spacer()
                        Text(meal?.strMeasure7 ?? "").foregroundColor(.blue)
                    }
                }
                if !((meal?.strIngredient8?.isEmpty) ?? false) {
                    HStack {
                        Text("8.")
                        Text(meal?.strIngredient8 ?? "")
                        Spacer()
                        Text(meal?.strMeasure8 ?? "").foregroundColor(.blue)
                    }
                }
            }
            Group {
                if !((meal?.strIngredient9?.isEmpty) ?? false) {
                    HStack {
                        Text("9.")
                        Text(meal?.strIngredient9 ?? "")
                        Spacer()
                        Text(meal?.strMeasure9 ?? "").foregroundColor(.blue)
                    }
                }
                if !((meal?.strIngredient10?.isEmpty) ?? false) {
                    HStack {
                        Text("10.")
                        Text(meal?.strIngredient10 ?? "")
                        Spacer()
                        Text(meal?.strMeasure10 ?? "").foregroundColor(.blue)
                    }
                }
                if !((meal?.strIngredient11?.isEmpty) ?? false) {
                    HStack {
                        Text("11.")
                        Text(meal?.strIngredient11 ?? "")
                        Spacer()
                        Text(meal?.strMeasure11 ?? "").foregroundColor(.blue)
                    }
                }
                if !((meal?.strIngredient12?.isEmpty) ?? false) {
                    HStack {
                        Text("12.")
                        Text(meal?.strIngredient12 ?? "")
                        Spacer()
                        Text(meal?.strMeasure12 ?? "").foregroundColor(.blue)
                    }
                }
                if !((meal?.strIngredient13?.isEmpty) ?? false) {
                    HStack {
                        Text("13.")
                        Text(meal?.strIngredient13 ?? "")
                        Spacer()
                        Text(meal?.strMeasure13 ?? "").foregroundColor(.blue)
                    }
                }
                if !((meal?.strIngredient14?.isEmpty) ?? false) {
                    HStack {
                        Text("14.")
                        Text(meal?.strIngredient14 ?? "")
                        Spacer()
                        Text(meal?.strMeasure14 ?? "").foregroundColor(.blue)
                    }
                }
                if !((meal?.strIngredient15?.isEmpty) ?? false) {
                    HStack {
                        Text("15.")
                        Text(meal?.strIngredient15 ?? "")
                        Spacer()
                        Text(meal?.strMeasure15 ?? "").foregroundColor(.blue)
                    }
                }
                if !((meal?.strIngredient16?.isEmpty) ?? false) {
                    HStack {
                        Text("16.")
                        Text(meal?.strIngredient16 ?? "")
                        Spacer()
                        Text(meal?.strMeasure16 ?? "").foregroundColor(.blue)
                    }
                }
            }
            Group {
                if !((meal?.strIngredient17?.isEmpty) ?? false) {
                    HStack {
                        Text("17.")
                        Text(meal?.strIngredient17 ?? "")
                        Spacer()
                        Text(meal?.strMeasure17 ?? "").foregroundColor(.blue)
                    }
                }
                if !((meal?.strIngredient18?.isEmpty) ?? false) {
                    HStack {
                        Text("18.")
                        Text(meal?.strIngredient18 ?? "")
                        Spacer()
                        Text(meal?.strMeasure18 ?? "").foregroundColor(.blue)
                    }
                }
                if !((meal?.strIngredient19?.isEmpty) ?? false) {
                    HStack {
                        Text("19.")
                        Text(meal?.strIngredient19 ?? "")
                        Spacer()
                        Text(meal?.strMeasure19 ?? "").foregroundColor(.blue)
                    }
                }
                if !((meal?.strIngredient20?.isEmpty) ?? false) {
                    HStack {
                        Text("20.")
                        Text(meal?.strIngredient20 ?? "")
                        Spacer()
                        Text(meal?.strMeasure20 ?? "").foregroundColor(.blue)
                    }
                }
            }
        }
    }
}


struct MealIngredientView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            MealIngredientView(meal: Meal(idMeal: "1", strMeal: "Padang", strDrinkAlternate: "Boba", strCategory: "Beef", strArea: "", strInstructions: "bake 35 minutes or until cooked through. Remove from oven and shred chicken in the dish using two forks.\r\n*Meanwhile, steam or cook the vegetables according to package directions.\r\nAdd the cooked vegetables and rice to the casserole dish with the chicken. Add most of the remaining sauce, reserving a bit to drizzle over the top when serving. Gently toss everything together in the casserole dish until combined. Return to oven and cook 15 minutes. Remove from oven and let stand 5 minutes before serving. Drizzle each serving with remaining sauce. Enjoy!", strMealThumb: "beef", strTags: "tags", strYoutube: "youtube", strIngredient1: "ingredient1", strIngredient2: "ingredient2", strIngredient3: "", strIngredient4: "ingredient4", strIngredient5: "ingredient2", strIngredient6: "ingredient2", strIngredient7: "ingredient2", strIngredient8: "ingredient2", strIngredient9: "ingredient2", strIngredient10: "ingredient2", strIngredient11: "ingredient2", strIngredient12: "ingredient2", strIngredient13: "ingredient2", strIngredient14: "ingredient2", strIngredient15: "ingredient2", strIngredient16: "ingredient2", strIngredient17: "ingredient2", strIngredient18: "ingredient2", strIngredient19: "ingredient2", strIngredient20: "ingredient2", strMeasure1: "measure", strMeasure2: "measure", strMeasure3: "fdsadsad", strMeasure4: "measure", strMeasure5: "measure", strMeasure6: "measure", strMeasure7: "measure", strMeasure8: "measure", strMeasure9: "measure", strMeasure10: "measure", strMeasure11: "measure", strMeasure12: "measure", strMeasure13: "measure", strMeasure14: "measure", strMeasure15: "measure", strMeasure16: "measure", strMeasure17: "measure", strMeasure18: "measure", strMeasure19: "measure", strMeasure20: "measure", strSource: "soruce", strImageSource: "image source", strCreativeCommonsConfirmed: "measure", dateModified: "date"))
        }
    }
}
