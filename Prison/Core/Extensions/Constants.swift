//
//  Constants.swift
//  Prison
//
//  Created by umaxsoft on 24/6/25.
//

// Constants.swift
// Prison

import Foundation

final class Constants {
    static let shared = Constants()
    
    let baseURL: String
    
    private init() {
        self.baseURL = "https://game.umaxsoft.com/prison/"
    }
}

