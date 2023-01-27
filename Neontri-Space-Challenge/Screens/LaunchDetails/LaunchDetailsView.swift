//
//  LaunchDetailsView.swift
//  Neontri-Space-Challenge
//
//  Created by Sebastian on 27/01/2023.
//

import SwiftUI

struct LaunchDetailsView: View {
    @Environment(\.openURL) var openUrl
    @StateObject var viewModel: LaunchDetailsViewModel
    
    var body: some View {
        VStack() {
            Text(viewModel.rocketName)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(50)
            Text(viewModel.missionType)
                .font(.headline)
                .fontWeight(.bold)
                .padding(.bottom)
            Text(viewModel.missionDescription)
                .multilineTextAlignment(.center)
                .padding(.bottom, 30)
            Text(viewModel.locationName)
                .padding(.bottom, 6)
            Text(viewModel.startDateDescription)
                .padding(.bottom, 6)
            Text(viewModel.wikiUrl)
                .onTapGesture {
                    viewModel.loadMoreInfo()
                }
            Spacer()
        }
        .multilineTextAlignment(.center)
        .font(.system(size: 20))
        .padding()
        .ignoresSafeArea()
    }
}

struct LaunchDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchDetailsView(viewModel: LaunchDetailsViewModel(launch: fakeEvent.fakeLaunch))
    }
}
