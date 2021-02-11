//
//  CovidManager.swift
//  CovidMap
//
//  Created by Vasilis Neophytou on 10/02/2021.
//

import Foundation

protocol CovidManagerDelegate {
    func didUpdateInfo(_ covidManager: CovidManager, covidModel: CovidModel)
    func didFailWithError(error: Error)
    func didFaildDecodingWithError(error: Error)
}

struct CovidManager {
    
    //base url for getting specific country covid info
    let baseURL = "https://disease.sh/v3/covid-19/countries"
    
    var delegate: CovidManagerDelegate?
    
    func getCovidInfo(for country: String) {
        let urlString = "\(baseURL)/\(country)?strict=true"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    self.delegate?.didFailWithError(error: error!)
                }
                if let safeData = data{
                    if let covidModel = parseJson(safeData){
                        self.delegate?.didUpdateInfo(self, covidModel: covidModel)
                    }
                }
            }
            
            task.resume()
        }
    }
    
    func parseJson(_ covidData: Data) -> CovidModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CovidData.self, from: covidData)
            
            let updated = decodedData.updated
            let todayCases = decodedData.todayCases
            let totalCases = decodedData.cases
            let todayDeaths = decodedData.todayDeaths
            let totalDeaths = decodedData.deaths
            
            let covidModel = CovidModel(updated: updated, todayCases: todayCases, cases: totalCases, todayDeaths: todayDeaths, deaths: totalDeaths )
            return covidModel
            
        }catch {
            delegate?.didFaildDecodingWithError(error: error)
            return nil
        }
    }
    
}
