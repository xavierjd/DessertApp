//
//  NetworkService.swift
//  DessertApp
//
//  Created by xavier on 24/08/23.
//

import Foundation
import Combine

protocol AllDessertsDataProtocol {
    func getData() throws -> AnyPublisher<DessertModel, Error>
}



class DessertDataService: AllDessertsDataProtocol {
    
    func getData() throws -> AnyPublisher<DessertModel, Error> {
        
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else { throw  NetworkingError.invalidURL }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap({ data in
                guard let response = data.response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else{
                    throw NetworkingError.badURLResponse(from: url)
                }
                return data.data
            })
            .decode(type: DessertModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
