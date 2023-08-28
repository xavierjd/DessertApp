//
//  MockDessertDetailData.swift
//  DessertApp
//
//  Created by xavier on 24/08/23.
//

import Foundation
import Combine

class MockDessertDetailData: DessertDetailDataProtocol {
    static let testData =
    DessertDetailModel(
        meals: [
            DetailModel(
                id: "53049",
                name: "Apam balik",
                area: "Malaysian",
                tags: "Tart,Baking,Fruity",
                imageURL: "dessert-1",
                videoURL: "https://www.youtube.com/watch?v=6R8ffRRJcrg",
                instructions: "Mix milk, oil and egg together. Sift flour, baking powder and salt into the mixture. Stir well until all ingredients are combined evenly.\r\n\r\nSpread some batter onto the pan. Spread a thin layer of batter to the side of the pan. Cover the pan for 30-60 seconds until small air bubbles appear.\r\n\r\nAdd butter, cream corn, crushed peanuts and sugar onto the pancake. Fold the pancake into half once the bottom surface is browned.\r\n\r\nCut into wedges and best eaten when it is warm",
                in1: "Milk",
                in2: "Oil",
                in3: "Eggs",
                in4: "Flour",
                in5: "Baking Powder",
                in6: "Salt",
                in7: "Unsalted Butter",
                in8: "Sugar",
                in9: "Peanut Butter",
                in10: "",
                in11: "",
                in12: "",
                in13: "",
                in14: "",
                in15: "",
                in16: "",
                in17: "",
                in18: "",
                in19: "",
                in20: "",
                me1: "200ml",
                me2: "60ml",
                me3: "2",
                me4: "1600g",
                me5: "3 tsp",
                me6: "1/2 tsp",
                me7: "25g",
                me8: "45g",
                me9: "3 tbs",
                me10: "",
                me11: "",
                me12: "",
                me13: "",
                me14: "",
                me15: "",
                me16: "",
                me17: "",
                me18: "",
                me19: "",
                me20: ""
            ),
        ])
    
    func getDessertDetails(dessert: DessertData) -> AnyPublisher<DessertDetailModel, Error> {
        Just(MockDessertDetailData.testData)
            .tryMap({$0})
            .eraseToAnyPublisher()
    }
}

