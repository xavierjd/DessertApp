//
//  FavDessertViewModel.swift
//  DessertApp
//
//  Created by xavier on 25/08/23.
//

import Foundation

class FavDessertViewModel: ObservableObject {
    
    let favDessertService: FavoriteDessertService
    let dessert: DessertData
    
    init(dessert: DessertData, favDessertService: FavoriteDessertService) {
        self.dessert = dessert
        self.favDessertService = favDessertService
    }
    
    func isInFavList() -> Bool {
        if favDessertService.existInFavDessert(dessert: dessert) {
            return true
        } else {
            return false
        }
    }
    
    func updateFavList() {
        favDessertService.updateFavoriteDesserts(dessert: dessert)
    }
    
    
    
    
}
