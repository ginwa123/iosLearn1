//
//  GLoadingView.swift
//  ginwaFood
//
//  Created by Gilang Trisetya Indrawan on 28/05/22.
//

import SwiftUI

struct GLoadingView: View {
    var body: some View {
        ProgressView()
            .scaleEffect(3)
            .frame(
                  maxWidth: .infinity,
                  maxHeight: .infinity,
                  alignment: .center)
    }
}

struct GLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        GLoadingView()
    }
}
