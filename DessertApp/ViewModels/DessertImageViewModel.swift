//
//  DessertImageViewModel.swift
//  DessertApp
//
//  Created by xavier on 25/08/23.
//

import Foundation
import SwiftUI

class DessertImageViewModel: ObservableObject {
    
    @Published var dessertImage: UIImage? = nil
    
    private let dessert: DessertData
    private let networkService: DessertImageProtocol
    private let imageFileManager: ImageFileManager
    private let folderName = "coin_images"
    private let imageName: String
    
    init(dessert: DessertData, networkService: DessertImageProtocol, imageFileManager: ImageFileManager) {
        self.dessert = dessert
        self.imageName = dessert.id
        self.networkService = networkService
        self.imageFileManager = imageFileManager
    }
    
    func retrieveImage() async {
        if let savedImage = imageFileManager.getImage(imageName: imageName, folderName: folderName) {
            await MainActor.run {
                    dessertImage = savedImage
            }
        } else {
            await loadImage()
        }
    }
    
    func loadImage() async {
        guard let image = try? await networkService.downloadDessertImage(dessert: dessert) else { return }
        imageFileManager.saveImage(image: image, imageName: imageName, folderName: folderName)
        await MainActor.run {
            withAnimation(.easeIn) {
                dessertImage = image
            }
        }
    }
}
