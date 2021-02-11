//
//  Extensions.swift
//  CovidMap
//
//  Created by Vasilis Neophytou on 10/02/2021.
//

import Foundation

extension Date {
    func formattedDateString(format: String? = "MMM d, h:mm a") -> String {
         
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_AU")
        dateFormatter.timeZone = TimeZone(abbreviation: "Australia/Sydney")
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
           
    }
}
