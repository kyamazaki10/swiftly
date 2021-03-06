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

    //MARK: Properties

    @IBOutlet var mapView: MQMapView!

    var mapCenter = CLLocationCoordinate2D()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let mapView = MQMapView(frame: view.bounds)
        mapView.setCenter(mapCenter, zoomLevel: 9, animated: false)
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
