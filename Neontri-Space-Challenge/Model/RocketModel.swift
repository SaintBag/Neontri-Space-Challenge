//
//  RocketModel.swift
//  Neontri-Space-Challenge
//
//  Created by Sebastian on 26/01/2023.
//

import Foundation

struct Rocket: Codable {
    let configuration: Configuration
}

struct Configuration: Codable {
    let fullName: String
    
    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
    }
}

