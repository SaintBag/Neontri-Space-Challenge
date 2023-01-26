//
//  LaunchView.swift
//  Neontri-Space-Challenge
//
//  Created by Sebastian on 26/01/2023.
//

import SwiftUI

struct LaunchView: View {
    var body: some View {
        EventPage()
    }
}

struct EventPage: View {
    
    var body: some View {
        VStack {
            Image(systemName: "person.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.blue, lineWidth: 10))
            EventInformation()
        }
        .padding()
    }
}
struct EventInformation: View {
    
    var body: some View {
        VStack {
            Text("Rocket Name")
                .font(.largeTitle)
            Text("Company")
                .font(.title)
                .padding(.bottom, 2)
            HStack {
                Text("Location name")
                Text("country code")
            }
            .font(.body)
            Text("Date")
                .font(.title)
                .padding(.vertical, 6.0)
            Text("Counting Down")
                .font(.largeTitle)
        }
        .padding()
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
