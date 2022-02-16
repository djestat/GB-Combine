//
//  Method.swift
//  Combine-APP
//
//  Created by Igor on 15.02.2022.
//

import Foundation

enum Method {
    static let baseURL = URL(string: "https://swapi.dev/api/")!
    
    case people(Int)
    case planets(Int)
    case starships(Int)
    
    var url: URL {
        switch self {
        case .people(let id):
            return Method.baseURL.appendingPathComponent("people/\(id)/")
        case .planets(let id):
            return Method.baseURL.appendingPathComponent("planets/\(id)/")
        case .starships(let id):
            return Method.baseURL.appendingPathComponent("starships/\(id)/")
        }
    }
    
}
