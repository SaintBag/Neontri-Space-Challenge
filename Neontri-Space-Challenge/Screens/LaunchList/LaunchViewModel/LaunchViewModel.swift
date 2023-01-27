//
//  LaunchViewModel.swift
//  Neontri-Space-Challenge
//
//  Created by Sebastian on 26/01/2023.
//

import Foundation


class LaunchViewModel: ObservableObject {
    @Published var launches: [Launch] = []
    @Published var errorMessage = ""
    private let apiService: LaunchFetchingProtocol
    
    init(apiService: LaunchFetchingProtocol) {
        self.apiService = apiService
    }
    @MainActor
    func fetchLunch() async {
        do {
            launches = try await apiService.fetchLaunches()
        } catch(let error) {
            if let launchError = error as? LaunchError {
                self.errorMessage = "Error: \(launchError.errorDescription)"
            }
        }
    }
}

enum LaunchError: LocalizedError {
    case invalidUrl
    case invalidStatusCode(statusCode: Int)
    case invalidData
    
    var errorDescription: String {
        switch self {
        case .invalidUrl:
            return "URL isn't valid"
        case .invalidStatusCode:
            return "Status code falls into the wrong range"
        case .invalidData:
            return "Response data is invalid"
        }
    }
}
