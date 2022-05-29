//
//  IngredientsModel.swift
//  ginwaFood
//
//  Created by Gilang Trisetya Indrawan on 28/05/22.
//

import Foundation

struct IngredientModel : Codable {
    let meals: [IngredientRowModel?]
}


struct IngredientRowModel :Hashable, Codable, Identifiable{
    var id : String { idIngredient ?? ""}
    let idIngredient : String?
    let strIngredient : String?
    let strDescription : String?
    let strType : String?

}
