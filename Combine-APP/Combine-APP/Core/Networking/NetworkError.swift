//
//  NetworkError.swift
//  Combine-APP
//
//  Created by Igor on 15.02.2022.
//

import Foundation

enum NetworkError: LocalizedError {
    
    case invalidURL(URL)
    case invalidResponse
    
    var errorDescription: String? {
        switch self {
        case .invalidURL(let url):
            return "\(url.absoluteString) invalid"
        case .invalidResponse:
            return "Invalid response"
        }
    }
    
}
