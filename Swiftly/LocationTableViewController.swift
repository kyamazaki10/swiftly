//
//  LocationTableViewController.swift
//  Swiftly
//
//  Created by Kumiko Yamazaki on 5/4/18.
//

import UIKit
import os.log

class LocationTableViewController: UITableViewController {

    //MARK: Properties

    var locations = [Location]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Use the edit button item provided by the table view controller.
        navigationItem.leftBarButtonItem = editButtonItem

        // Load the sample data.
        loadSampleLocations()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "LocationTableViewCell"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? LocationTableViewCell else {
            fatalError("The dequeued cell is not an instance of the LocationTableViewCell.")
        }

        // Fetches the appropriate location for the data source layout.
        let location = locations[indexPath.row]

        cell.nameLabel.text = location.name
        cell.ratingControl.rating = location.rating
        cell.photoImageView.image = location.photo

        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source.
            locations.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        switch(segue.identifier ?? "") {
            case "AddItem":
                os_log("Adding a new location.", log: OSLog.default, type: .debug)
            case "ShowDetail":
                guard let locationDetailViewController = segue.destination as? LocationViewController else {
                    fatalError("Unexpected destination: \(segue.destination)")
                }
                guard let selectedLocationCell = sender as? LocationTableViewCell else {
                    fatalError("Unexpected sender: \(String(describing: sender))")
                }
                guard let indexPath = tableView.indexPath(for: selectedLocationCell) else {
                    fatalError("The selected cell is not being displayed by the table.")
                }

                let selectedLocation = locations[indexPath.row]
                locationDetailViewController.location = selectedLocation
            default:
                fatalError("Unexpected segue identifier; \(String(describing: segue.identifier))")
        }
    }

    //MARK: Actions

    @IBAction func unwindToLocationList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? LocationViewController, let location = sourceViewController.location {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update an existing location.
                locations[selectedIndexPath.row] = location
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                // Add a new location.
                let newIndexPath = IndexPath(row: locations.count, section: 0)

                locations.append(location)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
    }

    //MARK: Private Methods

    private func loadSampleLocations() {
        let photo1 = UIImage(named: "location1")
        let photo2 = UIImage(named: "location2")
        let photo3 = UIImage(named: "location3")

        guard let location1 = Location(name: "Denver", rating: 4, photo: photo1) else {
            fatalError("Unable to instantiate photo1")
        }

        guard let location2 = Location(name: "Mile High City", rating: 5, photo: photo2) else {
            fatalError("Unable to instantiate photo2")
        }

        guard let location3 = Location(name: "The Centennial State", rating: 2, photo: photo3) else {
            fatalError("Unable to instantiate photo3")
        }

        locations += [location1, location2, location3]
    }
}
