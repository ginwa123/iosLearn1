//
//  ProfileCreatorView.swift
//  ginwaFood
//
//  Created by Gilang Trisetya Indrawan on 29/05/22.
//

import SwiftUI

struct ProfileCreatorView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            GCircleImage(
                image: Image("me")
                    .resizable()
                
                
            )
            .frame(width: 100,
                   height: 100,
                   alignment: .center)
            
            VStack(spacing: 0){
                Spacer()
                Text("Gilang Trisetya I.")
                    .bold()
                    .font(.title    )
                Spacer()
                Text("Surabaya, 1 October 1998")
                Text("Software Engineer")
                Spacer()
            }
            .padding()
            .background(Color(hex: "EFEFEF"))
            .frame( height: 100, alignment: .center)
            .cornerRadius(16)
            Spacer()
        }.padding()
    }
}

struct ProfileCreatorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCreatorView()
    }
}
