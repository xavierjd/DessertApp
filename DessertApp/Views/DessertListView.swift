//
//  DessertListView.swift
//  DessertApp
//
//  Created by xavier on 24/08/23.
//

import SwiftUI

struct DessertListView: View {
    
    @StateObject private var viewModel: DessertListViewModel
    
    private let dessertDetailService: DessertDetailDataProtocol
    private let dessertImageService: DessertImageProtocol
    private let imageFileManager: ImageFileManager
    private let favDessert: FavoriteDessertService
    
    init(
        dessertDataService: AllDessertsDataProtocol,
        dessertDetailService: DessertDetailDataProtocol,
        dessertImageService: DessertImageProtocol,
        imageFileManager: ImageFileManager,
        favDessert: FavoriteDessertService
    ) {
        _viewModel = StateObject(wrappedValue: DessertListViewModel(networkService: dessertDataService))
        self.dessertDetailService = dessertDetailService
        self.dessertImageService = dessertImageService
        self.imageFileManager = imageFileManager
        self.favDessert = favDessert
    }
    
    var body: some View {
        ScrollView {
            if let  dessertData = viewModel.desserts?.meals {
                VStack {
                    ForEach(dessertData) { dessert in
                        NavigationLink(value: dessert) {
                            DessertImageView(
                                dessert: dessert,
                                networkService: dessertImageService,
                                imageFileManager: imageFileManager)
                        }
                        HStack {
                            dessertName(name: dessert.name)
                            Spacer()
                            HeartView(dessert: dessert, favDessert: favDessert)
                        }
                        .padding(.bottom)
                    }
                }
            }
        }
        .navigationTitle(Text("🧁 World Desserts"))
        .navigationDestination(for: DessertData.self) { dessert in
            DessertDetailView(
                dessert: dessert,
                detailsNetworkService: dessertDetailService,
                imageNetworkService: dessertImageService,
                imageFileManager: imageFileManager)
        }
    }
}

struct DessertListView_Previews: PreviewProvider {
    
    static let mockDessertData = MockDessertData()
    static let mockDessertDetailData = MockDessertDetailData()
    static let imageFileManager = ImageFileManager()
    static let dessertImageService = DessertImageService()
    static let favDessert =  FavoriteDessertService()
    
    static var previews: some View {
        NavigationView {
            DessertListView(
                dessertDataService: mockDessertData,
                dessertDetailService: mockDessertDetailData,
                dessertImageService: dessertImageService,
                imageFileManager: imageFileManager,
                favDessert: favDessert
            )
        }
    }
}

extension DessertListView {
    
    private func dessertName(name: String ) -> some View {
        Text(name)
            .font(.headline)
            .foregroundColor(.primary)
            .padding(.leading)
    }
}
