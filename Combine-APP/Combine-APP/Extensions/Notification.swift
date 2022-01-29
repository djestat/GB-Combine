//
//  Notification.swift
//  Combine-APP
//
//  Created by Igor on 29.01.2022.
//

import Foundation

extension Notification.Name {
    
    static var generateInteger: Notification.Name {
        return .init(rawValue: "generateInteger")
    }
    
    static var generateString: Notification.Name {
        return .init(rawValue: "generateString")
    }
    
    static var generateStruct: Notification.Name {
        return .init(rawValue: "generateStruct")
    }
    
}
