//
//  LocationModel.swift
//  Neontri-Space-Challenge
//
//  Created by Sebastian on 26/01/2023.
//

import Foundation

struct Location: Codable, Equatable {
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
