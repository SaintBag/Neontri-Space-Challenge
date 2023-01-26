//
//  LaunchServiceProviderModel.swift
//  Neontri-Space-Challenge
//
//  Created by Sebastian on 26/01/2023.
//

import Foundation

struct LaunchServiceProvider: Codable {
    let name: String
    let type: LaunchServiceProviderType?
}

enum LaunchServiceProviderType: String, Codable {
    case commercial = "Commercial"
    case government = "Government"
    case multinational = "Multinational"
}
