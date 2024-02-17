//
//  DetailView.swift
//  FetchCodingChallenge
//
//  Created by Annie Foreman on 2/16/24.
//

import SwiftUI

struct DetailView: View {
    
    // dessert passed in
    let dessert: Dessert
    
    // local array of dessert details
    @State var dessertDetails: [MealDetails] = []
    // local array of instructions for display
    @State var instructions: String = ""
    // local array of ingredients for display
    @State var ingredients: [String] = []
    // local array of measurements for display
    @State var measurements: [String] = []
    
    var body: some View {
        NavigationStack {
            List {
                VStack(spacing: 20) {
                    Text(dessert.strMeal)
                        .font(.largeTitle)
                        .bold()
                    AsyncImage(url: URL(string: dessert.strMealThumb)) { image in image
                            .image?.resizable()
                            .frame(width: 300, height: 300, alignment: .topTrailing)
                    }
                    Text("Instructions: ")
                        .font(.headline)
                    Text(instructions)
                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    Text("Ingredients: ")
                        .font(.headline)
                    HStack(alignment: .top) {
                        HStack(spacing: 24) {
                            VStack(alignment: .leading) {
                                ForEach(ingredients, id: \.self) { ingredient in
                                    Text(ingredient)
                                    
                                }
                            }
                        }
                        HStack(spacing: 24) {
                            VStack(alignment: .trailing) {
                                ForEach(measurements, id: \.self) { measurement in
                                    Text(measurement)
                                }
                            }
                        }
                    }
                    
                }
                
                .onAppear{
                    // get dessert details from API
                    Api().fetchDetails(dessert.idMeal)
                    { (details) in
                        // set local detail array equal to the array of details in the fetched DetailContainer. This array will only have one element
                        dessertDetails = details.meals
                        instructions = dessertDetails[0].strInstructions
                        // temp array to store values, including null values
                        var tempIngredients: [String?] = []
                        tempIngredients.append(dessertDetails[0].strIngredient1)
                        tempIngredients.append(dessertDetails[0].strIngredient2)
                        tempIngredients.append(dessertDetails[0].strIngredient3)
                        tempIngredients.append(dessertDetails[0].strIngredient4)
                        tempIngredients.append(dessertDetails[0].strIngredient5)
                        tempIngredients.append(dessertDetails[0].strIngredient6)
                        tempIngredients.append(dessertDetails[0].strIngredient7)
                        tempIngredients.append(dessertDetails[0].strIngredient8)
                        tempIngredients.append(dessertDetails[0].strIngredient9)
                        tempIngredients.append(dessertDetails[0].strIngredient10)
                        tempIngredients.append(dessertDetails[0].strIngredient11)
                        tempIngredients.append(dessertDetails[0].strIngredient12)
                        tempIngredients.append(dessertDetails[0].strIngredient13)
                        tempIngredients.append(dessertDetails[0].strIngredient14)
                        tempIngredients.append(dessertDetails[0].strIngredient15)
                        tempIngredients.append(dessertDetails[0].strIngredient16)
                        tempIngredients.append(dessertDetails[0].strIngredient17)
                        tempIngredients.append(dessertDetails[0].strIngredient18)
                        tempIngredients.append(dessertDetails[0].strIngredient19)
                        tempIngredients.append(dessertDetails[0].strIngredient20)
                        
                        // add only ingredients that are populated to local array
                        for ingredient in tempIngredients {
                            if ingredient != nil && ingredient != "" {
                                ingredients.append(ingredient!)
                            }
                        }
                        
                        // temp array to store values, including null values
                        var tempMeasures: [String?] = []
                        tempMeasures.append(dessertDetails[0].strMeasure1)
                        tempMeasures.append(dessertDetails[0].strMeasure2)
                        tempMeasures.append(dessertDetails[0].strMeasure3)
                        tempMeasures.append(dessertDetails[0].strMeasure4)
                        tempMeasures.append(dessertDetails[0].strMeasure5)
                        tempMeasures.append(dessertDetails[0].strMeasure6)
                        tempMeasures.append(dessertDetails[0].strMeasure7)
                        tempMeasures.append(dessertDetails[0].strMeasure8)
                        tempMeasures.append(dessertDetails[0].strMeasure9)
                        tempMeasures.append(dessertDetails[0].strMeasure10)
                        tempMeasures.append(dessertDetails[0].strMeasure11)
                        tempMeasures.append(dessertDetails[0].strMeasure12)
                        tempMeasures.append(dessertDetails[0].strMeasure13)
                        tempMeasures.append(dessertDetails[0].strMeasure14)
                        tempMeasures.append(dessertDetails[0].strMeasure15)
                        tempMeasures.append(dessertDetails[0].strMeasure16)
                        tempMeasures.append(dessertDetails[0].strMeasure17)
                        tempMeasures.append(dessertDetails[0].strMeasure18)
                        tempMeasures.append(dessertDetails[0].strMeasure19)
                        tempMeasures.append(dessertDetails[0].strMeasure20)
                        
                        // add only measurements that are populated to local array
                        for measure in tempMeasures {
                            if measure != nil && measure != "" {
                                measurements.append(measure!)
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    DetailView(dessert: Dessert(strMeal: "Apam balik", strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg", idMeal: "53049"))
}
