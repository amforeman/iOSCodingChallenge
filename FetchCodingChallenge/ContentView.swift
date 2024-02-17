//
//  ContentView.swift
//  FetchCodingChallenge
//
//  Created by Annie Foreman on 2/16/24.
//

import SwiftUI

struct ContentView: View {
    // local array of desserts for display
    @State var desserts: [Dessert] = []
    
    var body: some View {
        NavigationStack {
            List(desserts) { dessert in
                NavigationLink {
                    DetailView(dessert: dessert)
                } label: {
                    Group {
                        AsyncImage(url: URL(string: dessert.strMealThumb)) {image in image
                                .image?.resizable()
                                .frame(width: 200, height: 200)
                            }
                        Text(dessert.strMeal)
                            
                    }
                }

            }
            .onAppear {
                // get desserts from API
                Api().fetchDesserts { (desserts) in
                    // set the local array equal to array of desserts held in the fetched DessertContainer
                    self.desserts = desserts.meals
                }
                // sort desserts alphabetically
                let sortedDesserts = desserts.sorted(by: {$0.strMeal < $1.strMeal})
                desserts = sortedDesserts
            }
            .navigationTitle("Desserts")
        }
    }
}

#Preview {
    ContentView()
}
