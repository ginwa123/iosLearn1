//
//  ContentView.swift
//  ginwaFood
//
//  Created by Gilang Trisetya Indrawan on 27/05/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowProfileCreate = false
    var body: some View {
        NavigationView {
            VStack {
                List {
                    NavigationLink {
                        CategoryMealListView()
                    } label: {
                        Text("Category")
                    }
                    NavigationLink {
                        AreaMealListView()
                    } label: {
                        Text("Area")
                    }
                    NavigationLink {
                        IngredientMealListView()
                    } label: {
                        Text("Ingredients")
                    }
                }
                .navigationTitle("Find Meal")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        GCircleImage(
                            image:
                                Image("avatar")
                                .resizable()
                        ).frame(width: 25,
                                height: 25,
                                alignment: .center)
                        .offset(x: 6, y: 0)
                        .onTapGesture {
                            print("Clicked")
                            self.isShowProfileCreate.toggle()
                        }
                        
                        
                    }
                }
                NavigationLink(destination:ProfileCreatorView(),
                               isActive: $isShowProfileCreate,
                               label: {
                    Text("")
                })
                .hidden()
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

