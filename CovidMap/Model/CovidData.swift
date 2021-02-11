//
//  CovidData.swift
//  CovidMap
//
//  Created by Vasilis Neophytou on 10/02/2021.
//

import Foundation

//struct used to decode the response json
struct CovidData: Codable {
    let updated: Double
    let todayCases: Int
    let cases: Int
    let todayDeaths: Int
    let deaths: Int
}
