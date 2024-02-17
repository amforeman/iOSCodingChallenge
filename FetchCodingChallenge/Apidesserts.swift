//
//  Apidesserts.swift
//  FetchCodingChallenge
//
//  Created by Annie Foreman on 2/16/24.
//

import Foundation
import SwiftUI

struct DessertContainer: Decodable {
    var meals: Array<Dessert>
}

struct Dessert: Codable, Identifiable {
    let id = UUID()
    var strMeal: String
    var strMealThumb: String
    var idMeal: String
}

struct DetailContainer: Decodable {
    var meals: [MealDetails]
}

struct MealDetails: Codable, Identifiable {
    let id = UUID()
    var idMeal: String
    var strMeal: String
    var strInstructions: String
    var strMealThumb: String
    var strIngredient1: String
    var strIngredient2: String
    var strIngredient3: String
    var strIngredient4: String
    var strIngredient5: String
    var strIngredient6: String
    var strIngredient7: String
    var strIngredient8: String
    var strIngredient9: String
    var strIngredient10: String
    var strIngredient11: String
    var strIngredient12: String
    var strIngredient13: String
    var strIngredient14: String
    var strIngredient15: String
    var strIngredient16: String
    var strIngredient17: String
    var strIngredient18: String
    var strIngredient19: String
    var strIngredient20: String
    var strMeasure1: String
    var strMeasure2: String
    var strMeasure3: String
    var strMeasure4: String
    var strMeasure5: String
    var strMeasure6: String
    var strMeasure7: String
    var strMeasure8: String
    var strMeasure9: String
    var strMeasure10: String
    var strMeasure11: String
    var strMeasure12: String
    var strMeasure13: String
    var strMeasure14: String
    var strMeasure15: String
    var strMeasure16: String
    var strMeasure17: String
    var strMeasure18: String
    var strMeasure19: String
    var strMeasure20: String
}

class Api {
    /*
     func: fetchDesserts() and fetchDetails(idMeal: String
     -----------------------------
     These functions make API calls to The Meal's API, convert the data from JSON, and result in structs
     acting as containers for the array of Desserts or Details
     */
    func fetchDesserts(completion: @escaping (DessertContainer) -> ()) {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {return}
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            do {
                let desserts = try JSONDecoder().decode(DessertContainer.self, from: data!)
                DispatchQueue.main.async {
                    completion(desserts)
                }
            }
            catch {
                print(error)
            }
        }
        .resume()
    }

    func fetchDetails(_ idMeal: String, completion: @escaping (DetailContainer) -> ()) {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(idMeal)") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            do {
                let details = try JSONDecoder().decode(DetailContainer.self, from: data!)
                DispatchQueue.main.sync {
                    completion(details)
                }
            }
            catch {
                print(error)
            }
        }
        .resume()
    }
    
}
