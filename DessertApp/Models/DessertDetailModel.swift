//
//  DessertDetailModel.swift
//  DessertApp
//
//  Created by xavier on 24/08/23.
//

import Foundation

struct DessertDetailModel: Codable {
    let meals: [DetailModel]
}

struct DetailModel: Codable, Hashable {
    let id: String
    let name: String
    let area: String
    let tags: String?
    let imageURL: String
    let videoURL: String
    let instructions: String
    let in1: String
    let in2: String
    let in3: String
    let in4: String
    let in5: String
    let in6: String
    let in7: String
    let in8: String
    let in9: String
    let in10: String
    let in11: String
    let in12: String
    let in13: String
    let in14: String
    let in15: String
    let in16: String?
    let in17: String?
    let in18: String?
    let in19: String?
    let in20: String?
    let me1: String
    let me2: String
    let me3: String
    let me4: String
    let me5: String
    let me6: String
    let me7: String
    let me8: String
    let me9: String
    let me10: String
    let me11: String
    let me12: String
    let me13: String
    let me14: String
    let me15: String
    let me16: String?
    let me17: String?
    let me18: String?
    let me19: String?
    let me20: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case area = "strArea"
        case tags =  "strTags"
        case imageURL = "strMealThumb"
        case videoURL = "strYoutube"
        case instructions = "strInstructions"
        case in1 = "strIngredient1"
        case in2 = "strIngredient2"
        case in3 = "strIngredient3"
        case in4 = "strIngredient4"
        case in5 = "strIngredient5"
        case in6 = "strIngredient6"
        case in7 = "strIngredient7"
        case in8 = "strIngredient8"
        case in9 = "strIngredient9"
        case in10 = "strIngredient10"
        case in11 = "strIngredient11"
        case in12 = "strIngredient12"
        case in13 = "strIngredient13"
        case in14 = "strIngredient14"
        case in15 = "strIngredient15"
        case in16 = "strIngredient16"
        case in17 = "strIngredient17"
        case in18 = "strIngredient18"
        case in19 = "strIngredient19"
        case in20 = "strIngredient20"
        case me1 = "strMeasure1"
        case me2 = "strMeasure2"
        case me3 = "strMeasure3"
        case me4 = "strMeasure4"
        case me5 = "strMeasure5"
        case me6 = "strMeasure6"
        case me7 = "strMeasure7"
        case me8 = "strMeasure8"
        case me9 = "strMeasure9"
        case me10 = "strMeasure10"
        case me11 = "strMeasure11"
        case me12 = "strMeasure12"
        case me13 = "strMeasure13"
        case me14 = "strMeasure14"
        case me15 = "strMeasure15"
        case me16 = "strMeasure16"
        case me17 = "strMeasure17"
        case me18 = "strMeasure18"
        case me19 = "strMeasure19"
        case me20 = "strMeasure20"
    }
    
    var ingredientsList: [IngredientModel] {
        return [
            addIngredientsValues(measure: me1, ingredient: in1),
            addIngredientsValues(measure: me2, ingredient: in2),
            addIngredientsValues(measure: me3, ingredient: in3),
            addIngredientsValues(measure: me4, ingredient: in4),
            addIngredientsValues(measure: me5, ingredient: in5),
            addIngredientsValues(measure: me6, ingredient: in6),
            addIngredientsValues(measure: me7, ingredient: in7),
            addIngredientsValues(measure: me8, ingredient: in8),
            addIngredientsValues(measure: me9, ingredient: in9),
            addIngredientsValues(measure: me10, ingredient: in10),
            addIngredientsValues(measure: me11, ingredient: in11),
            addIngredientsValues(measure: me12, ingredient: in12),
            addIngredientsValues(measure: me13, ingredient: in13),
            addIngredientsValues(measure: me14, ingredient: in14),
            addIngredientsValues(measure: me15, ingredient: in15),
            addIngredientsValues(measure: me16, ingredient: in16),
            addIngredientsValues(measure: me17, ingredient: in17),
            addIngredientsValues(measure: me18, ingredient: in18),
            addIngredientsValues(measure: me19, ingredient: in19),
            addIngredientsValues(measure: me20, ingredient: in20),
        ]
    }
    
    private func addIngredientsValues(measure: String?, ingredient: String? ) -> IngredientModel {
        
        if (measure == "") || (measure == nil) || (ingredient == "") || (ingredient == nil) {
            return IngredientModel(ingredient: nil)
        } else {
            return IngredientModel(ingredient: "•" + " " + measure! + " " + ingredient!)
        }
    }
    
    var tagsArray: [String]! {
        if let tagString = tags {
            return tagString.components(separatedBy: ",")
        } else {
            return nil
        }
    }
}

struct IngredientModel: Identifiable {
    let id = UUID().uuidString
    let ingredient: String?
}




