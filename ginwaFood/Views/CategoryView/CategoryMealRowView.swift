//
//  CategoryFoodRowView.swift
//  ginwaFood
//
//  Created by Gilang Trisetya Indrawan on 27/05/22.
//

import SwiftUI


struct CategoryMealRowView: View {
    let rowModel: CategoryRowModel?
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: rowModel?.strCategoryThumb ?? "")) { phase in
                if let image = phase.image {
                    image.resizable() // Displays the loaded image.
                } else if phase.error != nil {
                    Image("noImage").resizable()
                } else {
                    ProgressView() // Acts as a placeholder.
                }
            }
            .frame(width: 50, height: 50)
            Text(rowModel?.strCategory ?? "")
            Spacer()
        }
    }
}

struct CategoryMealRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CategoryMealRowView(rowModel: CategoryRowModel(
                idCategory: "1",
                strCategory: "Beef",
                strCategoryThumb: "beef",
                strCategoryDescription: "Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times.[1] Beef is a source of high-quality protein and essential nutrients.[2]"))
            .previewLayout(.fixed(width: 300, height: 80))
            CategoryMealRowView(rowModel: CategoryRowModel(
                idCategory: "1",
                strCategory: "Beef",
                strCategoryThumb: "https://www.themealdb.com//images//category//beef.png",
                strCategoryDescription: "Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times.[1] Beef is a source of high-quality protein and essential nutrients.[2]"))
            .previewLayout(.fixed(width: 300, height: 80))
        }
    }
}
