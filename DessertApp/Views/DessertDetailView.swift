//
//  DessertDetailView.swift
//  DessertApp
//
//  Created by xavier on 24/08/23.
//

import SwiftUI

struct DessertDetailView: View {
    
    @StateObject var viewModel: DessertDetailViewModel
    private let dessert: DessertData
    private let imageNetworkService: DessertImageProtocol
    private let imageFileManager: ImageFileManager
    
    
    init(
        dessert: DessertData,
        detailsNetworkService: DessertDetailDataProtocol,
        imageNetworkService: DessertImageProtocol,
        imageFileManager: ImageFileManager
    ) {
        _viewModel = StateObject(wrappedValue: DessertDetailViewModel(dessert: dessert, networkService: detailsNetworkService))
        self.dessert = dessert
        self.imageNetworkService = imageNetworkService
        self.imageFileManager = imageFileManager
        
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                DessertImageView(dessert: dessert, networkService: imageNetworkService, imageFileManager: imageFileManager)
                
                tagSection
                
                descriptionSection
                
                Divider()
                
                ingredientsSection
                
                Divider()
                
                instructionSection
            }
        }
        .ignoresSafeArea()
    }
}

struct DessertDetailView_Previews: PreviewProvider {
    static let dessert = DessertData(
        id: "53049",
        name: "Apam balik",
        imageUrl: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")
    static let detailsNetworkService = MockDessertDetailData()
    static let dessertImageService = DessertImageService()
    static let imageFileManager = ImageFileManager()
    
    static var previews: some View {
        DessertDetailView(dessert: dessert, detailsNetworkService: detailsNetworkService, imageNetworkService: dessertImageService, imageFileManager: imageFileManager)
    }
}

extension DessertDetailView {
    
    private var tagSection: some View {
        HStack {
            if let tagsArray = viewModel.dessertDetails?.meals.first?.tagsArray {
                HStack {
                    ForEach(tagsArray, id: \.self) { tags in
                        Text(tags)
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .padding(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.secondary, lineWidth: 0.5)
                            )
                    }
                }
                .padding(.leading)
            }
        }
    }
    
    private var descriptionSection: some View {
        VStack(alignment: .leading) {
            Text(viewModel.dessertDetails?.meals.first?.name ?? "")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.leading)
            HStack {
                Text(viewModel.dessertDetails?.meals.first?.area ?? "")
                    .font(.title3)
                    .foregroundColor(.secondary)
                    .padding(.leading)
                Spacer()
                if let url = URL(string: viewModel.dessertDetails?.meals.first?.videoURL ?? "") {
                    Link(destination: url ) {
                        Text("Watch on Youtube")
                            .font(.caption)
                            .foregroundColor(.blue)
                            .padding(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                
                                    .stroke(.blue, lineWidth: 0.5)
                            )
                            .padding(.trailing)
                    }
                }
            }
            
        }
    }
    
    private var ingredientsSection: some View {
        VStack(alignment: .leading) {
            Text("Ingredients")
                .font(.title)
                .padding(.top)
                .padding(.bottom)
            
            if let ingredientsList = viewModel.dessertDetails?.meals.first?.ingredientsList {
                ForEach(ingredientsList, id: \.id) { ingredient in
                    if let ingredientData = ingredient.ingredient {
                        Text(ingredientData)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
        .padding(.leading)
        .padding(.bottom)
    }
    
    private var instructionSection: some View {
        VStack(alignment: .leading) {
            Text("Instructions")
                .font(.title)
                .padding(.bottom)
            Text(viewModel.dessertDetails?.meals.first?.instructions ?? "")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}

