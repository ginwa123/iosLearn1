//
//  GSearchBarView.swift
//  ginwaFood
//
//  Created by Gilang Trisetya Indrawan on 29/05/22.
//

import SwiftUI

// simpleSearchBar
struct GSearchBarView: View {
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    
    // callback
    var onChange: (_ searchText: String) -> ()
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(hex: "EFEFEF"))
                .frame(height: 40)
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search", text: $searchText)
                    .onChange(of: searchText, perform: {newValue in
                        self.onChange(searchText)
                        self.showCancelButton = true
                    })
                Button(action: {
                    self.searchText = ""
                }) {
                    Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                }.offset(x:-10)
            }
            .foregroundColor(.blue)
            .padding(.leading, 13)
        }
        .frame(height: 40)
        .cornerRadius(8)
        .padding()
    }
}

struct GSearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        GSearchBarView { searchText in
            
        }.previewLayout(.fixed(width: 300, height: 100))
    }
}
