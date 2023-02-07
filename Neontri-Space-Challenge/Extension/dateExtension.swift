//
//  dateExtension.swift
//  Neontri-Space-Challenge
//
//  Created by Sebastian on 27/01/2023.
//

import Foundation

extension Date {
    func formatted() -> String {
        let dateFormater = DateFormatter()
        dateFormater.locale = Locale(identifier: "en_US_POSIX")
        dateFormater.dateFormat = "MM-dd-yyyy HH:mm"
        let stringDate = dateFormater.string(from: self)
        return stringDate
    }
}
