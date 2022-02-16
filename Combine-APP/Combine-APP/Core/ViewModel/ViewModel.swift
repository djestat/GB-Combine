//
//  ViewModel.swift
//  Combine-APP
//
//  Created by Igor on 16.02.2022.
//

import Foundation
import Combine

enum DataSourseType: String {
    case people = "People"
    case planet = "Planet"
    case starship = "Starship"
    
}

struct AnyModel: Identifiable {
    let id = UUID()
    var value: Codable
    
    func description() -> String { "\(value)" }
}

struct ViewModel {
    private let apiClient: ApiClient
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
    
    //MARK: init
    internal init(type: DataSourseType = .people, selectedIndex: Int = 0) {
        self.apiClient = ApiClient()
        self.type = type
        self.selectedIndex = selectedIndex
    }

    //MARK: Func-s
    func typeDescription() -> String { type.rawValue }
    
    func getSourseByType() -> AnyModel {
        switch type {
        case .people:
            return AnyModel(value: "people")
        case .planet:
            return AnyModel(value: "planet")
        case .starship:
            return AnyModel(value: "starship")
        }
    }
}
