//
//  LaunchStatusModel.swift
//  Neontri-Space-Challenge
//
//  Created by Sebastian on 26/01/2023.
//

import Foundation

struct LaunchStatus : Codable, Equatable {
    let name: Name
    let abbrev: Abbrev
    let description: String?
}

enum Name: String, Codable, Equatable {
    case ellipticalOrbit = "Elliptical Orbit"
    case geostationaryOrbit = "Geostationary Orbit"
    case geostationaryTransferOrbit = "Geostationary Transfer Orbit"
    case geosynchronousOrbit = "Geosynchronous Orbit"
    case geosynchronousTransferOrbit = "Geosynchronous Transfer Orbit"
    case goForLaunch = "Go for Launch"
    case heliocentricL1 = "Heliocentric L1"
    case heliocentricNA = "Heliocentric N/A"
    case highEarthOrbit = "High Earth Orbit"
    case launchFailure = "Launch Failure"
    case launchSuccessful = "Launch Successful"
    case launchWasAPartialFailure = "Launch was a Partial Failure"
    case lowEarthOrbit = "Low Earth Orbit"
    case lunarOrbit = "Lunar Orbit"
    case mediumEarthOrbit = "Medium Earth Orbit"
    case polarOrbit = "Polar Orbit"
    case solarEscapeTrajectory = "Solar Escape Trajectory"
    case suborbital = "Suborbital"
    case sunEarthL2 = "Sun-Earth L2"
    case sunSynchronousOrbit = "Sun-Synchronous Orbit"
    case supersynchronousTransferOrbi = "Supersynchronous Transfer Orbi"
    case toBeConfirmed = "To Be Confirmed"
    case toBeDetermined = "To Be Determined"
}

enum Abbrev: String, Codable {
    case directGEO = "Direct-GEO"
    case elliptical = "Elliptical"
    case failure = "Failure"
    case go = "Go"
    case gso = "GSO"
    case gsto = "GSTO"
    case gto = "GTO"
    case helioNA = "Helio-N/A"
    case heo = "HEO"
    case l1Point = "L1-point"
    case l2 = "L2"
    case leo = "LEO"
    case lo = "LO"
    case meo = "MEO"
    case partialFailure = "Partial Failure"
    case po = "PO"
    case solarEsc = "Solar Esc."
    case sso = "SSO"
    case sub = "Sub"
    case success = "Success"
    case superGTO = "Super-GTO"
    case tbc = "TBC"
    case tbd = "TBD"
}
