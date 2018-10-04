//
//  MapViewController.swift
//  Swiftly
//
//  Created by kyamazaki10 on 7/3/18.
//

import UIKit
import Mapbox
import MapQuestMaps

class MapViewController: UIViewController {
    @IBOutlet var mapView: MQMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let mapView = MQMapView(frame: view.bounds)
        mapView.setCenter(CLLocationCoordinate2D(latitude: 39.7384, longitude: -104.9848), zoomLevel: 9, animated: false)
        view.addSubview(mapView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
