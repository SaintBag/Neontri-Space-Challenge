//
//  Neontri_Space_ChallengeTests.swift
//  Neontri-Space-ChallengeTests
//
//  Created by Sebastian on 27/01/2023.
//

import XCTest
@testable import Neontri_Space_Challenge

class MockApiService: LaunchFetchingProtocol {
    
    var launchesToBeReturned: [Neontri_Space_Challenge.Launch] = []
    var errorToBeThrown: Error?
    
    
    func fetchLaunches() async throws -> [Neontri_Space_Challenge.Launch] {
        if let errorToBeThrown {
            throw errorToBeThrown
        }
        return launchesToBeReturned
    }
    
}

final class LaunchViewModelTests: XCTestCase {
    
    var sut: LaunchViewModel!
    var mockApiService: MockApiService!
    
    
    override func setUpWithError() throws {
        mockApiService = MockApiService()
        sut = LaunchViewModel(apiService: mockApiService)
        
    }
    
    override func tearDownWithError() throws {
        sut = nil
        mockApiService = nil
        
    }
    
    func testApiServiceEmptyLaunches() async throws {
        mockApiService.launchesToBeReturned = []
        await sut.fetchLunch()
        XCTAssertEqual(sut.launches, [])
    }
    
    func testUsersOnApiClientSuccess() async throws {
        mockApiService.launchesToBeReturned = [fakeEvent.fakeLaunch]
        await sut.fetchLunch()
        XCTAssertEqual(sut.launches, [fakeEvent.fakeLaunch])
    }
    
    func testApiServiceErrorMessageInvalidUrl() async throws {
        mockApiService.errorToBeThrown = LaunchError.invalidUrl
        await sut.fetchLunch()
        XCTAssertEqual(sut.errorMessage, "Error: \(LaunchError.invalidUrl.errorDescription)")
    }
    
    func testApiServiceErrorMessageInvalidData() async throws {
        mockApiService.errorToBeThrown = LaunchError.invalidData
        await sut.fetchLunch()
        XCTAssertEqual(sut.errorMessage, "Error: \(LaunchError.invalidData.errorDescription)")
    }
    
    func testApiServiceErrorMessageInvalidStatusCode() async throws {
        mockApiService.errorToBeThrown = LaunchError.invalidStatusCode(statusCode: 404)
        await sut.fetchLunch()
        XCTAssertEqual(sut.errorMessage, "Error: \(LaunchError.invalidStatusCode(statusCode: 404).errorDescription)")
    }
}

