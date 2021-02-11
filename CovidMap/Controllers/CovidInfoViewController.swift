//
//  CovidInfoViewController.swift
//  CovidMap
//
//  Created by Vasilis Neophytou on 10/02/2021.
//

import UIKit

class CovidInfoViewController: UIViewController {

    var covidManager = CovidManager()
    
    var countryName: String?
    var isoCode: String?
    
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var lastUpdatedLabel: UILabel!
    @IBOutlet weak var todayCasesLabel: UILabel!
    @IBOutlet weak var totalCasesLabel: UILabel!
    @IBOutlet weak var todayDeathsLabel: UILabel!
    @IBOutlet weak var totalDeathsLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        countryLabel.text = countryName
        
        covidManager.delegate = self
        
        //Requesting info with country isoCode
        if let code = isoCode {
            covidManager.getCovidInfo(for: code)
        }
        
    }

}

//MARK:- CovidManagerDelegate
extension CovidInfoViewController: CovidManagerDelegate {
    
    func didUpdateInfo(_ covidManager: CovidManager, covidModel: CovidModel) {
        DispatchQueue.main.async {
            self.infoView.isHidden = false
            self.messageLabel.isHidden = true
            self.lastUpdatedLabel.text = covidModel.lastUpdatedString
            self.todayCasesLabel.text = "New cases: \(covidModel.todayCases)"
            self.totalCasesLabel.text = "Total cases: \(covidModel.cases)"
            self.todayDeathsLabel.text = "New deaths: \(covidModel.todayDeaths)"
            self.totalDeathsLabel.text = "Total deaths: \(covidModel.deaths)"
            self.view.backgroundColor = covidModel.getBackgroundColor
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    //Displaying error when decoding data
    func didFaildDecodingWithError(error: Error) {
        
        DispatchQueue.main.async {
            self.infoView.isHidden = true
            self.messageLabel.isHidden = false
            self.messageLabel.text = error.localizedDescription
        }
        
    }
    
}
