//
//  NetworkErrors.swift
//  DessertApp
//
//  Created by xavier on 27/08/23.
//

import Foundation

enum NetworkingError: LocalizedError{
    case badURLResponse(from: URL)
    case unknown
    case invalidURL
    
    var errorDescription: String?{
        switch self {
        case .badURLResponse(from: let url): return "[🔥] Bad response from URL: \(url)"
        case .unknown: return "[⚠️] Unknown error occured"
        case .invalidURL: return "[⚠️] invalid URL"
        }
    }
}
