//
//  DessertDetailViewModel.swift
//  DessertApp
//
//  Created by xavier on 24/08/23.
//

import Foundation
import Combine

class DessertDetailViewModel: ObservableObject {
    @Published var dessertDetails: DessertDetailModel? = nil
    @Published var dessert: DessertData
    var cancellables = Set<AnyCancellable>()
    
    private let networkService: DessertDetailDataProtocol
    
    init(dessert: DessertData, networkService: DessertDetailDataProtocol) {
        self.dessert = dessert
        self.networkService = networkService
        self.loadDessertDetails(dessert: dessert)
    }
    
    private func loadDessertDetails(dessert: DessertData) {
        
        do {
            try networkService.getDessertDetails(dessert: dessert)
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }, receiveValue: { [weak self] returnedDessertDetails in
                self?.dessertDetails = returnedDessertDetails
            })
            .store(in: &cancellables)
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
    
    
}
