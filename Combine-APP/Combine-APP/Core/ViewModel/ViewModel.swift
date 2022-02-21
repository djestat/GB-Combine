//
//  ViewModel.swift
//  Combine-APP
//
//  Created by Igor on 16.02.2022.
//

import SwiftUI
import Combine

enum DataSourseType: String {
    case people = "People"
    case planet = "Planet"
    case starship = "Starship"
    
}

struct AnyModel: Identifiable, Hashable {
    let id = UUID()
    let people: People?
    let planet: Planet?
    let starship: Starship?
    
    func description() -> String {
        if let people = people {
            return "\(people)"
        } else if let planet = planet {
            return "\(planet)"
        } else if let starship = starship {
            return "\(starship)"
        } else {
            return "nil"
        }
    }
    
    internal init(people: People? = nil, planet: Planet? = nil, starship: Starship? = nil) {
        self.people = people
        self.planet = planet
        self.starship = starship
    }
}


final class ViewModel: ObservableObject {
    
    private let apiClient: ApiClient
    private var subscriptions: Set<AnyCancellable> = []
    private var type: DataSourseType
    
    var selectedIndex: Int {
        didSet {
            switch selectedIndex {
            case 0:
                type = .people
            case 1:
                type = .planet
            case 2:
                type = .starship
            default:
                type = .people
            }
        }
    }
    
    @Published private(set) var dataSource: [AnyModel] = []
    
    //MARK: init
    internal init(type: DataSourseType = .people, selectedIndex: Int = 0) {
        self.apiClient = ApiClient()
        self.type = type
        self.selectedIndex = selectedIndex
    }

    //MARK: Func-s
    func typeDescription() -> String { type.rawValue }
    
    func getSourseByType(with id: Int) {
        switch type {
        case .people:
            let apiPublisher = apiClient.getPeople(id: id)
            apiPublisher
                .print("VM ----- people")
                .sink(receiveCompletion: { print($0) },
                      receiveValue: { [weak self] in
                    self?.dataSource.append(AnyModel(people: $0))
                    print("VM ----- receiveValue \($0)")
                })
                .store(in: &subscriptions)
        case .planet:
            let apiPublisher = apiClient.getPlanets(id: id)
            apiPublisher
                .print("VM ----- planet")
                .sink(receiveCompletion: { print($0) },
                      receiveValue: { [weak self] in
                    self?.dataSource.append(AnyModel(planet: $0))
                    print("VM ----- receiveValue")
                })
                .store(in: &subscriptions)
        case .starship:
            let apiPublisher = apiClient.getStarships(id: id)
            apiPublisher
                .print("VM ----- starship")
                .sink(receiveCompletion: { print($0) },
                      receiveValue: { [weak self] in
                    self?.dataSource.append(AnyModel(starship: $0))
                    print("VM ----- receiveValue ")
                })
                .store(in: &subscriptions)
        }
    }
    
    func clearDataSouce() {
        dataSource.removeAll()// = []
    }
}
