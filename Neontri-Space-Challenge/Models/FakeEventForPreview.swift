//
//  FakeEventForPreview.swift
//  Neontri-Space-Challenge
//
//  Created by Sebastian on 26/01/2023.
//

import Foundation

struct fakeEvent {
    
    static let fakeLaunch = Launch(
        id: "00af0700-46de-4438-bbc3-09b6c0721ee9",
        name: "H-IIA 202 | IGS Radar-7",
        status: LaunchStatus(
            name: Name.launchSuccessful,
            abbrev: Abbrev.success,
            description: "The launch vehicle successfully inserted its payload(s) into the target orbit(s)."),
        net: Date(timeIntervalSince1970: 1590242591),
        probability: 90,
        launchServiceProvider: LaunchServiceProvider(
            name: "Mitsubishi Heavy Industries",
            type: LaunchServiceProviderType.government),
        rocket: Rocket(
            configuration: Configuration(fullName: "H-IIA 202")),
        mission: Mission(
            name: "IGS Radar-7",
            description: "The IGS-Radar 7 is a Japanese radar reconnaissance satellite. The satellite is operated by the Cabinet Satellite Information Center. The satellite serves both Japan's national defense and civil natural disaster monitoring."),
        pad: Pad(
            name: "Yoshinobu Launch Complex",
            wikiURL: "https://en.wikipedia.org/wiki/Yoshinobu_Launch_Complex",
            location: Location(
                name: "Tanegashima, Japan",
                countryCode:
                    CountryCode.jpn,
                totalLaunchCount: 85,
                totalLandingCount: 0),
            totalLaunchCount: 85),
        webcastLive: false,
        image: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/h-iia2520202_image_20190222031201.jpeg",
        lastUpdated: Date()
    
    )
}
