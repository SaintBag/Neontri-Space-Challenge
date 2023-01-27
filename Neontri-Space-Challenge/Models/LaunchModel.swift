//
//  LaunchModel.swift
//  Neontri-Space-Challenge
//
//  Created by Sebastian on 26/01/2023.
//

import Foundation

struct LaunchesResponse: Codable {
    let count: Int
    let results: [Launch]
}

struct Launch: Codable, Identifiable {
    let id: String
    let name: String
    let status: LaunchStatus
    let net: Date?
    let probability: Int?
    let launchServiceProvider: LaunchServiceProvider?
    let rocket: Rocket
    let mission: Mission?
    let pad: Pad
    let webcastLive: Bool //MARK: Not sure if I need it
    let image: String?
    let lastUpdated: Date? //MARK: Not sure if I need it
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case status
        case net
        case probability
        case launchServiceProvider = "launch_service_provider"
        case rocket, mission, pad
        case webcastLive = "webcast_live"
        case image
        case lastUpdated = "last_updated"
    }
}

