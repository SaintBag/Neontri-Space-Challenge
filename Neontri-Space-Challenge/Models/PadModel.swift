//
//  PadModel.swift
//  Neontri-Space-Challenge
//
//  Created by Sebastian on 26/01/2023.
//

import Foundation

struct Pad: Codable, Equatable {
    let name: String
    let wikiURL: String?
    let location: Location
    let totalLaunchCount: Int
    
    enum CodingKeys: String, CodingKey {
        case name
        case wikiURL = "wiki_url"
        case location
        case totalLaunchCount = "total_launch_count"
    }
}
