//
//  ContentView.swift
//  Neontri-Space-Challenge
//
//  Created by Sebastian on 26/01/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = LaunchViewModel(apiService: ApiService())
    var body: some View {
        NavigationView {
            ZStack {
                Text(viewModel.errorMessage)
                List {
                    ForEach(viewModel.launches, id: \.id) { launch in
                        Text(launch.name) 
                            .foregroundColor(.blue)
                            .listRowSeparator(.hidden)
                    }
                }
                .navigationTitle("Upcoming Launches")
                .task {
                   await viewModel.fetchLunch()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
