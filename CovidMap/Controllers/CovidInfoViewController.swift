//
//  CovidInfoViewController.swift
//  CovidMap
//
//  Created by Vasilis Neophytou on 10/02/2021.
//

import UIKit

class CovidInfoViewController: UIViewController {

    var countryName: String?
    
    @IBOutlet weak var countryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.isUserInteractionEnabled = false
        countryLabel.text = countryName
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
