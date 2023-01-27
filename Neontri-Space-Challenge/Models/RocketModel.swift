//
//  RocketModel.swift
//  Neontri-Space-Challenge
//
//  Created by Sebastian on 26/01/2023.
//

import Foundation

struct Rocket: Codable, Equatable {
    let configuration: Configuration
}

struct Configuration: Codable, Equatable {
    let fullName: String
    
    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
    }
}

