//
//  MissionModel.swift
//  Neontri-Space-Challenge
//
//  Created by Sebastian on 26/01/2023.
//

import Foundation

struct Mission: Codable, Equatable {
    let name, description: String
    
    enum CodingKeys: String, CodingKey {
        case name, description
    }
}
