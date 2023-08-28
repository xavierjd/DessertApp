//
//  MockNetworkService.swift
//  DessertApp
//
//  Created by xavier on 24/08/23.
//

import Foundation
import Combine

class MockDessertData: AllDessertsDataProtocol {
    
    let testData: DessertModel = DessertModel(
        meals: [
        DessertData(
            id: "53049",
            name: "Apam balik",
            imageUrl: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"),
        DessertData(
            id: "52893",
            name: "Apple & Blackberry Crumble",
            imageUrl: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg"),
        DessertData(
            id: "52768",
            name: "Apple Frangipan Tart",
            imageUrl: "https://www.themealdb.com/images/media/meals/wxywrq1468235067.jpg"),
        DessertData(
            id: "52767",
            name: "Bakewell tart",
            imageUrl: "https://www.themealdb.com/images/media/meals/wyrqqq1468233628.jpg"),
        DessertData(
            id: "52855",
            name: "Banana Pancakes",
            imageUrl: "https://www.themealdb.com/images/media/meals/sywswr1511383814.jpg"),
        ])
    
    func getData() -> AnyPublisher<DessertModel, Error> {
        Just(testData)
            .tryMap({$0})
            .eraseToAnyPublisher()
    }
}
