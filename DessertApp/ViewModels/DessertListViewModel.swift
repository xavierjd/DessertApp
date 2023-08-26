//
//  DessertListViewModel.swift
//  DessertApp
//
//  Created by xavier on 24/08/23.
//

import Foundation
import Combine

class DessertListViewModel: ObservableObject {
    
    @Published var desserts: DessertModel? = nil
    var cancellables = Set<AnyCancellable>()
    private let networkService: AllDessertsDataProtocol
    
    init(networkService: AllDessertsDataProtocol) {
        self.networkService = networkService
       loadDesserts()
    }
    
    private func loadDesserts() {
        networkService.getData().sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                print(error.localizedDescription)
            }
        }, receiveValue: { [weak self] returnedDesserts in
            self?.desserts = returnedDesserts
        })
        .store(in: &cancellables)
    }
    
//    func isInFavDesserts(dessertID: String) -> Bool {
//        if favoriteDessertService.existInFavDessert(id: dessertID) {
//            return true
//        } else {
//            return false
//        }
//    }
//
//    func updateFavDessert(id: String){
//        favoriteDessertService.updateFavoriteDesserts(id: id)
//    }
}
