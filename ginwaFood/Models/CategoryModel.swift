//
//  CatergoryModel.swift
//  ginwaFood
//
//  Created by Gilang Trisetya Indrawan on 27/05/22.
//

import Foundation
import SwiftUI
import CoreLocation

struct CategoryModel: Hashable, Codable {
    let categories: [CategoryRowModel?]
}


struct CategoryRowModel: Hashable, Codable,Identifiable  {
    var id: String { idCategory ?? ""}
    let idCategory: String? // id
    let strCategory: String? // category name
    let strCategoryThumb: String? // thumbnail
    let strCategoryDescription: String? // description
    
    var image: Image {
        Image(strCategoryThumb ?? "")
    }
}
