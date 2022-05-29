//
//  IngredientMealRowView.swift
//  ginwaFood
//
//  Created by Gilang Trisetya Indrawan on 28/05/22.
//

import SwiftUI

struct IngredientMealRowView: View {
    let rowModel: IngredientRowModel?
    var appendUrl = ""
    
    init(rowModel: IngredientRowModel?) {
        self.rowModel = rowModel
        self.appendUrl = (rowModel?.strIngredient ?? "")
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
    }
    var body: some View {
        HStack {
            AsyncImage(
                url: URL(
                    string:"https://www.themealdb.com/images/ingredients/" +
                    appendUrl + ".png")) { phase in
                        if let image = phase.image {
                            image.resizable() // Displays the loaded image.
                        } else if phase.error != nil {
                            Image("noImage").resizable()
                        } else {
                            ProgressView() // Acts as a placeholder.
                        }
                    }
                    .frame(width: 50, height: 50)
            Text(rowModel?.strIngredient ?? "")
            Spacer()
        }
    }
}

struct IngredientMealRowView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientMealRowView(rowModel: IngredientRowModel(idIngredient: "", strIngredient: "Selada", strDescription: "Description", strType: ""))
    }
}
