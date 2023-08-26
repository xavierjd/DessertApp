//
//  DessertDetailNetworkService.swift
//  DessertApp
//
//  Created by xavier on 24/08/23.
//

import Foundation
import Combine

protocol DessertDetailDataProtocol {
    func getDessertDetails(dessert: DessertData) -> AnyPublisher<DessertDetailModel, Error>
}


class DessertDetailService: DessertDetailDataProtocol {
    func getDessertDetails(dessert: DessertData) -> AnyPublisher<DessertDetailModel, Error> {
        let url  = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=" + dessert.id)!
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap({ data in
                guard let response = data.response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else{
                    throw NetworkingError.badURLResponse(from: url)
                }
                return data.data
            })
            .decode(type: DessertDetailModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}



