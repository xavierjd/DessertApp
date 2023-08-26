//
//  IngredientsCell.swift
//  DessertApp
//
//  Created by xavier on 24/08/23.
//

import SwiftUI

struct IngredientView: View {
    
    let ingredient: String
    
    var body: some View {
        if ingredient != "" {
            Text("•\(ingredient)")
                .foregroundColor(.secondary)
        } else {
            EmptyView()
        }
    }
    
}

struct IngredientsCell_Previews: PreviewProvider {
    static let ingredient = "Milk"
    static var previews: some View {
        IngredientView(ingredient: ingredient)
    }
}
