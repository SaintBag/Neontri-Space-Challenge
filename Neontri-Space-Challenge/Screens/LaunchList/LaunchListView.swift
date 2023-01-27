//
//  LaunchListView.swift
//  Neontri-Space-Challenge
//
//  Created by Sebastian on 26/01/2023.
//

import SwiftUI

struct LaunchListView: View {
    @State private var isShowingSheet = false
    @StateObject var viewModel = LaunchViewModel(apiService: ApiService())
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.black]
        UILabel.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).adjustsFontSizeToFitWidth = true
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    Text(viewModel.errorMessage)
                    LazyVStack(spacing: 24) {
                        ForEach(viewModel.launches) { event in
                            LaunchView(launch: event)
                                .onTapGesture {
                                    isShowingSheet.toggle()
                                    
                                }.sheet(isPresented: $isShowingSheet) {
                                    LaunchDetailsView(
                                        rocketName: event.name,
                                        missionDescription: event.mission?.description,
                                        locationName: event.pad.location.name,
                                        missionType: event.mission?.name,
                                        startDate: viewModel.dateToString(date: event.net ?? Date()),
                                        wikiUrl: event.pad.wikiURL)
                                    .background(.black)
                                }
                        }
                    }
                }
                .padding(.horizontal, 8) 
                .navigationBarTitle("Upcoming Rocket Events")
                .foregroundColor(.white)
                .task {
                    await viewModel.fetchLunch()
                }
            }.background(.black)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchListView()
    }
}
