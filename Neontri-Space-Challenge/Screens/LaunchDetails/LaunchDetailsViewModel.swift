//
//  LaunchDetailsViewModel.swift
//  Neontri-Space-Challenge
//
//  Created by Sebastian on 27/01/2023.
//

import Foundation

class LaunchDetailsViewModel: ObservableObject {
    private let launch: Launch
    
    init(launch: Launch) {
        self.launch = launch
    }
    
    var rocketName: String { launch.rocket.configuration.fullName }
    var missionDescription: String { launch.mission?.description ?? "" }
    var locationName: String { launch.pad.location.name }
    var missionType: String { launch.mission?.name ?? "" }
    var startDateDescription: String { launch.net?.formatted() ?? "" }
    var wikiUrl: String { launch.pad.wikiURL ?? "" }
}
