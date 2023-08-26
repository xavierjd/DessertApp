//
//  DessertImageView.swift
//  DessertApp
//
//  Created by xavier on 25/08/23.
//

import SwiftUI

struct DessertImageView: View {
    
    @StateObject var viewModel: DessertImageViewModel
    
    init(dessert: DessertData, networkService: DessertImageProtocol, imageFileManager: ImageFileManager) {
        _viewModel = StateObject(wrappedValue: DessertImageViewModel(dessert: dessert, networkService: networkService, imageFileManager: imageFileManager))
    }
    
    var body: some View {
        ZStack {
            if let image = viewModel.dessertImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else {
                Image("placeholder")
                    .resizable()
                    .scaledToFit()
            }
        }
        .shadow(color: Color.black.opacity(0.3) , radius: 10, x: 0, y: 10)
        .padding(.bottom)
        .onAppear {
            Task {
                await viewModel.retrieveImage()
            }
        }
    }
}

struct DessertImageView_Previews: PreviewProvider {
    
    static let dessertImage = DessertImageService()
    
    static let dessertData = DessertData(id: "53049", name: "Apam balik", imageUrl: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")
    
    static let imageFileManager = ImageFileManager()
    
    static var previews: some View {
        DessertImageView(dessert: dessertData, networkService: dessertImage, imageFileManager: imageFileManager)
    }
}
