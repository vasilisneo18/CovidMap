//
//  ViewController.swift
//  CovidMap
//
//  Created by Vasilis Neophytou on 10/02/2021.
//

import UIKit
import MapKit

class MapViewController: UIViewController, UIGestureRecognizerDelegate {

    var countryName: String?
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        gestureRecognizer.delegate = self
        mapView.addGestureRecognizer(gestureRecognizer)
    }

    @objc func handleTap(gestureRecognizer: UILongPressGestureRecognizer) {
        
        let touchLocation = gestureRecognizer.location(in: mapView)
        let coordinate = mapView.convert(touchLocation, toCoordinateFrom: mapView)

        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)

        geoCoder.reverseGeocodeLocation(location, completionHandler:
            {
                placemarks, error -> Void in

                // Place details
                guard let placeMark = placemarks?.first else { return }

                // Country
                if let country = placeMark.country {
                    self.countryName = country

                    print(country)
                    self.performSegue(withIdentifier: "toCovidInfo", sender: self)

                }
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCovidInfo" {
            let destinationVC = segue.destination as! CovidInfoViewController
            destinationVC.countryName = countryName!
        }
    }
    
    
}

