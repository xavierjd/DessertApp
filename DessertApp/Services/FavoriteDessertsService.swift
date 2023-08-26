//
//  FavoriteDesserts.swift
//  DessertApp
//
//  Created by xavier on 25/08/23.
//

import Foundation
import CoreData

class FavoriteDessertService {
    private let container: NSPersistentContainer
    private let containerName: String = "FavoritesContainer"
    private let entityName: String = "FavoritesEntity"
    
    @Published var favoriteDesserts: [FavoritesEntity] = []
    
    init() {
        container =  NSPersistentContainer(name: containerName)
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Error loading Core Data! \(error)")
            }
            self.getFavoriteDesserts()
        }
    }
    
    // MARK: PUBLIC
    func updateFavoriteDesserts(dessert: DessertData){
        if let entity = favoriteDesserts.first(where: { $0.dessertID == dessert.id }) {
                delete(entity: entity)
        } else {
            add(dessertID: dessert.id)
        }
    }
    
    func existInFavDessert(dessert: DessertData) -> Bool {
        if favoriteDesserts.first(where: { $0.dessertID == dessert.id }) != nil {
            return true
        } else {
            return false
        }
    }
    
    // MARK: PRIVATE
    
    private func getFavoriteDesserts(){
        let request = NSFetchRequest<FavoritesEntity>(entityName: entityName)
        do {
            favoriteDesserts = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching Portfolio Entities. \(error)")
        }
    }
    
    private func add(dessertID: String){
        let entity =  FavoritesEntity(context: container.viewContext)
        entity.dessertID = dessertID
        applyChanges()
    }

    private func update(entity: FavoritesEntity, id: String){
        entity.dessertID = id
        applyChanges()
    }

    private func delete(entity: FavoritesEntity){
        container.viewContext.delete(entity)
        applyChanges()
    }

    private func save(){
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error saving to Core Data. \(error)")
        }
    }
    
    private func applyChanges(){
        save()
        getFavoriteDesserts()
    }
}
