//
//  NetworkService.swift
//  DessertApp
//
//  Created by xavier on 24/08/23.
//

import Foundation
import Combine

protocol AllDessertsDataProtocol {
    func getData() -> AnyPublisher<DessertModel, Error>
}

enum NetworkingError: LocalizedError {
    case badURLResponse(from: URL)
    case unknown
    
    var errorDescription: String?{
        switch self {
        case .badURLResponse(from: let url): return " Bad response from URL: \(url)"
        case .unknown: return "Unknown error occured"
            
        }
    }
}

class DessertDataService: AllDessertsDataProtocol {
    let url  = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")!

    func getData() -> AnyPublisher<DessertModel, Error> {

        URLSession.shared.dataTaskPublisher(for: url)
            .map({$0.data})
            .decode(type: DessertModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()

    }
    

}
