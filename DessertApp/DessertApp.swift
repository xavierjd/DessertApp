//
//  DessertAppApp.swift
//  DessertApp
//
//  Created by xavier on 24/08/23.
//

import SwiftUI

@main
struct DessertApp: App {
    
    static let dessertData = DessertDataService()
    static let dessertDataService = DessertDataService()
    static let dessertDetailService = DessertDetailService()
    static let dessertImageService  = DessertImageService()
    static let imageFileManager = ImageFileManager()
    static let favDessert = FavoriteDessertService()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                DessertListView(
                    dessertDataService: DessertApp.dessertDataService,
                    dessertDetailService: DessertApp.dessertDetailService,
                    dessertImageService: DessertApp.dessertImageService,
                    imageFileManager: DessertApp.imageFileManager,
                    favDessert: DessertApp.favDessert
                )
            }
        }
    }
}
