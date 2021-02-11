//
//  CovidModel.swift
//  CovidMap
//
//  Created by Vasilis Neophytou on 10/02/2021.
//

import UIKit

struct CovidModel {
    let updated: Double
    let todayCases: Int
    let cases: Int
    let todayDeaths: Int
    let deaths: Int
    
    //Converting timeInterval into string format "MMM d, h:mm a"
    var lastUpdatedString: String {
        
        let epochTime = TimeInterval(updated) / 1000
        let date = Date(timeIntervalSince1970: epochTime)
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        dateFormatter.dateFormat = "MMM d, h:mm a"
        let textToDisplay = dateFormatter.string(from: date)

        return textToDisplay
    }
    
    var getBackgroundColor: UIColor {
        if cases < 50000 {
            return #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        }else if cases < 300000 {
            return #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        }else {
            return #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        }
    }
    
    
}


