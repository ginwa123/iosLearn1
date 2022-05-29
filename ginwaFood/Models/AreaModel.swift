//
//  AreaModel.swift
//  ginwaFood
//
//  Created by Gilang Trisetya Indrawan on 28/05/22.
//

import Foundation

struct AreaModel : Codable {
    let meals : [AreaRowModel?]
}

struct AreaRowModel : Codable, Identifiable  {
    var id: String { strArea ?? "" }
    let strArea : String?
  
}
