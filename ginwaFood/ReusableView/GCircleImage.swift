//
//  GCircleImage.swift
//  ginwaFood
//
//  Created by Gilang Trisetya Indrawan on 29/05/22.
//

import SwiftUI

struct GCircleImage: View {
    var image: Image

    var body: some View {
        image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
    }
}

struct GCircleImage_Previews: PreviewProvider {
    static var previews: some View {
        GCircleImage(image: Image("avatar").resizable())
            .previewLayout(.fixed(width: 300, height: 300))
    }
}
