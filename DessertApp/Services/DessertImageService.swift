//
//  LoadImageService.swift
//  DessertApp
//
//  Created by xavier on 25/08/23.
//

import Foundation
import SwiftUI

protocol DessertImageProtocol {
    func downloadDessertImage(dessert: DessertData) async throws -> UIImage?
}

class DessertImageService: DessertImageProtocol {
    
    func downloadDessertImage(dessert: DessertData) async throws -> UIImage? {
        guard let url = URL(string: dessert.imageUrl) else { throw NetworkingError.invalidURL }
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let image = UIImage(data: data),
                let response = response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
                        return nil
                    }
            return image
        } catch {
            throw NetworkingError.badURLResponse(from: url)
        }
    }
}
