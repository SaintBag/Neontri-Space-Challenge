//
//  LaunchDetailsViewModelTests.swift
//  Neontri-Space-ChallengeTests
//
//  Created by Sebastian on 27/01/2023.
//

import XCTest
@testable import Neontri_Space_Challenge


final class LaunchDetailsViewModelTests: XCTestCase {
    
    var sut: LaunchDetailsViewModel!

    override func setUpWithError() throws {
        sut = LaunchDetailsViewModel(launch: fakeEvent.fakeLaunch)
    }

    override func tearDownWithError() throws {
       sut = nil
    }
    
    func testRocketNameIsCorrect() {
        XCTAssertEqual(sut.rocketName, "H-IIA 202")
    }
    
    func testMissionDescriptionIsCorrect() {
        XCTAssertEqual(sut.missionDescription, "The IGS-Radar 7 is a Japanese radar reconnaissance satellite. The satellite is operated by the Cabinet Satellite Information Center. The satellite serves both Japan's national defense and civil natural disaster monitoring.")
    }
    
    func testLocationNameIsCorrect() {
        XCTAssertEqual(sut.locationName, "Tanegashima, Japan")
    }
    
    func testMissionTypeIsCorrect() {
        XCTAssertEqual(sut.missionType, "IGS Radar-7")
    }
    
    func testWikiUrlIsCorrect() {
        XCTAssertEqual(sut.wikiUrl, "https://en.wikipedia.org/wiki/Yoshinobu_Launch_Complex")
    }
    
    func testStartDateDescription() {
        XCTAssertEqual(sut.startDateDescription, "05-23-2020 16:03")
    }
    
}


