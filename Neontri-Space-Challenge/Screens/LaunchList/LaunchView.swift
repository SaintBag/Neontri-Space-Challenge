//
//  LaunchView.swift
//  Neontri-Space-Challenge
//
//  Created by Sebastian on 26/01/2023.
//

import SwiftUI

struct LaunchView: View {
    @StateObject var viewModel = LaunchViewModel(apiService: ApiService())
    let launch: Launch
    
    var body: some View {
        VStack {
            ImagePlaceholderView()
            LaunchEventDetailsView(
                rocketName: launch.name,
                companyName: launch.launchServiceProvider?.name, 
                locationName: launch.pad.location.name,
                countryCode: launch.pad.location.countryCode.rawValue,
                eventType: launch.launchServiceProvider?.type?.rawValue,
                date: viewModel.dateToString(date: launch.net))
        }
        .padding()
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView(launch: fakeEvent.fakeLaunch)
    }
}


