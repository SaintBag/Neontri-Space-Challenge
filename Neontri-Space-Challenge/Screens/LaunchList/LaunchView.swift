//
//  LaunchView.swift
//  Neontri-Space-Challenge
//
//  Created by Sebastian on 26/01/2023.
//

import SwiftUI
import URLImage

struct LaunchView: View {
    @StateObject var viewModel = LauchListViewModel(apiService: ApiService())
    let launch: Launch
    
    var body: some View {
        VStack {
            ImagePlaceholderView(imageString: launch.image, id: launch.id)
            LaunchEventDetailsView(
                rocketName: launch.name,
                companyName: launch.launchServiceProvider?.name, 
                locationName: launch.pad.location.name,
                countryCode: launch.pad.location.countryCode.rawValue,
                eventType: launch.launchServiceProvider?.type?.rawValue,
                date: launch.net?.formatted() ?? "")
        }
        .padding()
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView(launch: fakeEvent.fakeLaunch)
    }
}


