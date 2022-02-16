//
//  ApiClient.swift
//  Combine-APP
//
//  Created by Igor on 15.02.2022.
//

import Foundation
import Combine

struct ApiClient {
    private let decoder = JSONDecoder()
    private let queue = DispatchQueue(label: "ApiClient",
                                      qos: .default, 
                                      attributes: .concurrent)
    
    
    func getPeople(id: Int) -> AnyPublisher<People, Error> {
        URLSession.shared
            .dataTaskPublisher(for: Method.people(id).url)
            .receive(on: queue)
            .map( \.data)
            .decode(type: People.self, decoder: decoder)
            .mapError { error -> Error in
                switch error {
                case is URLError:
                    return NetworkError.invalidURL(Method.people(id).url)
                default:
                    return NetworkError.invalidResponse
                }
            }
            .eraseToAnyPublisher()
    }
    
    func mergedPeoples(ids: [Int]) -> AnyPublisher<People, Error> {
        precondition(!ids.isEmpty)
        
        let initialPublisher = getPeople(id: 0)
        let reminder = Array(ids.dropFirst())
        
        return reminder.reduce(initialPublisher) { combined, id in
            return combined
                .merge(with: getPeople(id: id))
                .eraseToAnyPublisher()
        }
    }
}
