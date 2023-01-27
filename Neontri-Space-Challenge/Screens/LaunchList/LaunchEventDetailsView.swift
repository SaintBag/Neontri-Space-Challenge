//
//  LaunchEventDetailsView.swift
//  Neontri-Space-Challenge
//
//  Created by Sebastian on 27/01/2023.
//

import SwiftUI

struct LaunchEventDetailsView: View {
    let rocketName: String?
    let companyName: String?
    let locationName: String?
    let countryCode: String?
    let eventType: String?
    let date: String?
    
    var body: some View {
        VStack {
            Text(rocketName ?? "")
                .font(.largeTitle)
                .minimumScaleFactor(0.01)
                .padding(.bottom, 6)
            Text(companyName ?? "")
                .font(.title)
                .padding(.bottom, 2)
                .minimumScaleFactor(0.01)
            Text(locationName ?? "")
                .minimumScaleFactor(0.01)
                .font(.title2)
            Text("Mission type: \(eventType ?? "")")
                .font(.title2)
            
            Text(date ?? "Unknow")
                .font(.title)
                .minimumScaleFactor(0.01)
                .padding(.vertical, 6.0)
        }
        .background(.black)
        .foregroundColor(.white)
        .multilineTextAlignment(.center)
        .padding()
    }
}

struct LaunchEventDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchEventDetailsView(rocketName: "Rocket Name", companyName: "Company Name", locationName: "Location Name", countryCode: "Country Code", eventType: "Event Type Name", date: "Start Date")
    }
}
