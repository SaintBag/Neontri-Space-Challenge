//
//  LaunchDetailsView.swift
//  Neontri-Space-Challenge
//
//  Created by Sebastian on 27/01/2023.
//

import SwiftUI

struct LaunchDetailsView: View {
    @Environment(\.openURL) var openUrl
    let rocketName: String?
    let missionDescription: String?
    let locationName: String?
    let missionType: String?
    let startDate: String?
    let wikiUrl: String?
    
    var body: some View {
        VStack {
            Text(rocketName ?? "")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(50)
            Text(missionType ?? "")
                .font(.headline)
                .fontWeight(.bold)
                .padding(.bottom)
            Text(missionDescription ?? "")
                .multilineTextAlignment(.center)
                .padding(.bottom, 30)
            Text(startDate ?? "")
            Text(wikiUrl ?? "")
                .onTapGesture {
                    load(url: wikiUrl)
                }
            Spacer()
        }
        .font(.system(size: 20))
        .padding()
        .ignoresSafeArea()
    }
    
    func load(url: String?) {
        guard let link = url,
              let url = URL(string: link) else { return }
        openUrl(url)
    }
}

struct LaunchDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchDetailsView(rocketName: "Rocket Name", missionDescription: "Mision descrtiption", locationName: "Location Name", missionType: "Mision type", startDate: "Start Date", wikiUrl: "Wiki Url")
    }
}
