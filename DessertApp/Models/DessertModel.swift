//
//  DessertModel.swift
//  DessertApp
//
//  Created by xavier on 24/08/23.
//

import Foundation

struct DessertModel: Codable, Hashable {
    let meals: [DessertData]
}

struct DessertData: Codable, Identifiable, Hashable {
    let id: String
    let name: String
    let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case imageUrl = "strMealThumb"
    }
    
}

