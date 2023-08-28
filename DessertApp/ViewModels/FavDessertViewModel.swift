//
//  FavDessertViewModel.swift
//  DessertApp
//
//  Created by xavier on 26/08/23.
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
        if favDessertService.isSaved(dessert: dessert) {
            return true
        } else {
            return false
        }
    }
    
    func updateFavList() {
        favDessertService.update(dessert: dessert)
    }
}
