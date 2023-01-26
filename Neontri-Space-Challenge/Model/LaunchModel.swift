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

struct LaunchStatus : Codable {
    let name: Name
    let abbrev: Abbrev
    let description: String?
}

enum Name: String, Codable {
    case ellipticalOrbit = "Elliptical Orbit"
    case geostationaryOrbit = "Geostationary Orbit"
    case geostationaryTransferOrbit = "Geostationary Transfer Orbit"
    case geosynchronousOrbit = "Geosynchronous Orbit"
    case geosynchronousTransferOrbit = "Geosynchronous Transfer Orbit"
    case goForLaunch = "Go for Launch"
    case heliocentricL1 = "Heliocentric L1"
    case heliocentricNA = "Heliocentric N/A"
    case highEarthOrbit = "High Earth Orbit"
    case launchFailure = "Launch Failure"
    case launchSuccessful = "Launch Successful"
    case launchWasAPartialFailure = "Launch was a Partial Failure"
    case lowEarthOrbit = "Low Earth Orbit"
    case lunarOrbit = "Lunar Orbit"
    case mediumEarthOrbit = "Medium Earth Orbit"
    case polarOrbit = "Polar Orbit"
    case solarEscapeTrajectory = "Solar Escape Trajectory"
    case suborbital = "Suborbital"
    case sunEarthL2 = "Sun-Earth L2"
    case sunSynchronousOrbit = "Sun-Synchronous Orbit"
    case supersynchronousTransferOrbi = "Supersynchronous Transfer Orbi"
    case toBeConfirmed = "To Be Confirmed"
    case toBeDetermined = "To Be Determined"
}

enum Abbrev: String, Codable {
    case directGEO = "Direct-GEO"
    case elliptical = "Elliptical"
    case failure = "Failure"
    case go = "Go"
    case gso = "GSO"
    case gsto = "GSTO"
    case gto = "GTO"
    case helioNA = "Helio-N/A"
    case heo = "HEO"
    case l1Point = "L1-point"
    case l2 = "L2"
    case leo = "LEO"
    case lo = "LO"
    case meo = "MEO"
    case partialFailure = "Partial Failure"
    case po = "PO"
    case solarEsc = "Solar Esc."
    case sso = "SSO"
    case sub = "Sub"
    case success = "Success"
    case superGTO = "Super-GTO"
    case tbc = "TBC"
    case tbd = "TBD"
}

struct LaunchServiceProvider: Codable {
    let name: String
    let type: LaunchServiceProviderType?
}

enum LaunchServiceProviderType: String, Codable {
    case commercial = "Commercial"
    case government = "Government"
    case multinational = "Multinational"
}

struct Rocket: Codable {
    let configuration: Configuration
}

struct Configuration: Codable {
    let fullName: String
    
    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
    }
}

struct Mission: Codable {
    let name, description: String
    
    enum CodingKeys: String, CodingKey {
        case name, description
    }
}

struct Pad: Codable {
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

enum CountryCode: String, Codable {
    case chn = "CHN"
    case guf = "GUF"
    case ind = "IND"
    case irn = "IRN"
    case isr = "ISR"
    case jpn = "JPN"
    case kaz = "KAZ"
    case kor = "KOR"
    case mhl = "MHL"
    case nzl = "NZL"
    case prk = "PRK"
    case rus = "RUS"
    case unk = "UNK"
    case usa = "USA"
}

struct Location: Codable {
    let name: String
    let countryCode: CountryCode
    let totalLaunchCount, totalLandingCount: Int //MARK: Delete? Not sure if I need it
    
    enum CodingKeys: String, CodingKey {
        case name
        case countryCode = "country_code"
        case totalLaunchCount = "total_launch_count"
        case totalLandingCount = "total_landing_count"
    }
}

struct Launch: Codable, Identifiable {
    let id: String
    let name: String
    let status: LaunchStatus
    let net: String
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

