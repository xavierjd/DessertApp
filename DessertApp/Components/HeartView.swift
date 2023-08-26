//
//  HeartView.swift
//  DessertApp
//
//  Created by xavier on 25/08/23.
//

import SwiftUI

struct HeartView: View {
    @StateObject private var viewModel: FavDessertViewModel
    
    @State var addedToFavList = false
    
    init(dessert: DessertData, favDessert: FavoriteDessertService) {
        _viewModel = StateObject(wrappedValue: FavDessertViewModel(dessert: dessert, favDessertService: favDessert))
    }
    
    var body: some View {
        ZStack {
            if addedToFavList {
                HStack {
                    Image(systemName: "heart.fill")
                        .font(.system(size: 25))
                        .foregroundColor(.red)
                }
            } else {
                HStack {
                    Image(systemName: "heart")
                        .font(.system(size: 25))
                        .foregroundColor(.secondary)
                }

            }
        }
        .onTapGesture {
            viewModel.updateFavList()
            addedToFavList.toggle()
        }
        .onAppear(perform: {
            addedToFavList = viewModel.isInFavList()
            
        })
        .padding(.trailing)
    }
}

struct HeartView_Previews: PreviewProvider {
    
    static let mockDessertData = DessertData(id: "53049", name: "Apam balik", imageUrl: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")
    static let favDessert =  FavoriteDessertService()
    
    static var previews: some View {
        HeartView(dessert: mockDessertData, favDessert: favDessert)
    }
}
