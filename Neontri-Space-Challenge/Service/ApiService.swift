//
//  ApiService.swift
//  Neontri-Space-Challenge
//
//  Created by Sebastian on 27/01/2023.
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
            return response.results
            
        } catch {
            throw LaunchError.invalidData
        }
    }
}
