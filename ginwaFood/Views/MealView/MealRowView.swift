//
//  MealFoodRowView.swift
//  ginwaFood
//
//  Created by Gilang Trisetya Indrawan on 28/05/22.
//

import SwiftUI

struct MealRowView: View {
    let rowModel: MealRowModel?
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: rowModel?.strMealThumb ?? "")) { phase in
                if let image = phase.image {
                    image.resizable() // Displays the loaded image.
                } else if phase.error != nil {
                    Image("noImage").resizable()
                } else {
                    ProgressView() // Acts as a placeholder.
                }
            }
            .frame(width: 50, height: 50)
            .cornerRadius(20)
            .aspectRatio(contentMode: .fit)
            Text(rowModel?.strMeal ?? "")
            Spacer()
        }
    }
}

struct MealRowView_Previews: PreviewProvider {
    static var previews: some View {
        MealRowView(rowModel: MealRowModel(
            strMeal: "123",
            strMealThumb: "Beef is good",
            idMeal: "1")
        )
    }
}
