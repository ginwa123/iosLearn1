//
//  AreaMealRowView.swift
//  ginwaFood
//
//  Created by Gilang Trisetya Indrawan on 28/05/22.
//

import SwiftUI

struct AreaMealRowView: View {
    let rowModel: AreaRowModel?
    var body: some View {
        Text(rowModel?.strArea ?? "")
    }
}

struct AreaMealRowView_Previews: PreviewProvider {
    static var previews: some View {
        AreaMealRowView(rowModel: AreaRowModel(strArea: "American"))
    }
}




