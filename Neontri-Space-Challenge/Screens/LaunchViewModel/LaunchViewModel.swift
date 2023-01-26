//
//  LaunchViewModel.swift
//  Neontri-Space-Challenge
//
//  Created by Sebastian on 26/01/2023.
//

import Foundation

protocol LaunchFetchingProtocol {
    func fetchLaunches() async throws -> [Launch]
}

class ApiService: LaunchFetchingProtocol {
    
    func fetchLaunches() async throws -> [Launch] {
        let launchUrlString = "https://ll.thespacedevs.com/2.2.0/launch/upcoming/"
        guard let url = URL(string: launchUrlString) else {
            throw LaunchError.invalidUrl
        }
        
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        if let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 400 {
            throw LaunchError.invalidStatusCode(statusCode: statusCode)
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let response = try decoder.decode(LaunchesResponse.self, from: data)
            print(response)
            return response.results
            
        } catch {
            print(data)
            print("problem to decode JSON", error)
            throw LaunchError.failedToDecode(error: error)
        }
    }
}

@MainActor
class LaunchViewModel: ObservableObject {
    @Published var launches: [Launch] = []
    @Published var errorMessage = ""
    private let apiService: LaunchFetchingProtocol
    
    init(apiService: LaunchFetchingProtocol) {
        self.apiService = apiService
    }
    
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
    case failedToDecode(error: Error)
    
    var errorDescription: String {
        switch self {
        case .invalidUrl:
            return "URL isn't valid"
        case .invalidStatusCode:
            return "Status code falls into the wrong range"
        case .invalidData:
            return "Response data is invalid"
        case .failedToDecode:
            return "Failed to decode"
        }
    }
}
