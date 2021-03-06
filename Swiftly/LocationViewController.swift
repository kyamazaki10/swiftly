//
//  LocationViewController.swift
//  Swiftly
//
//  Created by Kumiko Yamazaki on 3/12/18.
//

import MapKit
import UIKit
import os.log

class LocationViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //MARK: Properties

    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var viewMap: UIButton!

    // This value is either passed by `LocationTableViewController` in `prepare(for:sender:)` or constructed as part of adding a new location.
    var location: Location?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Handle the text field's user input through delegate callbacks.
        locationTextField.delegate = self

        // Set up views if editing an existing Location.
        if let location = location {
            navigationItem.title = location.name
            locationTextField.text = location.name
            photoImageView.image = location.photo
            ratingControl.rating = location.rating
        }

        // Enable the Save button only if the text field has a Location name.
        updateSaveButtonState()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: UITextFieldDelegate

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()

        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the Save button while editing.
        saveButton.isEnabled = false
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        navigationItem.title = textField.text
    }

    //MARK: UIImagePickerControllerDelegate

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }

        // Set photoImageView to display the selected image.
        photoImageView.image = selectedImage

        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }

    //MARK: Navigation

    @IBAction func cancel(_ sender: UIBarButtonItem) {
        // Depending on style of presentation (modal or push presentation), this view controller
        // needs to be dismissed in two different ways.
        let isPresentingInAddLocationMode = presentingViewController is UINavigationController

        if isPresentingInAddLocationMode {
            dismiss(animated: true, completion: nil)
        } else if let owningNavigationController = navigationController {
            owningNavigationController.popViewController(animated: true)
        } else {
            fatalError("The LocationViewController is not inside a navigation controller.")
        }
    }

    // This method lets you configure a view controller before it's presented.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        // Pass the location to the MapViewController if the "View on Map" button is pressed.
        if (segue.identifier == "ShowMap") {
            let mapViewController = segue.destination as? MapViewController

            // TODO: Geocode each location.
            mapViewController?.mapCenter = CLLocationCoordinate2D(latitude: 39.7384, longitude: -104.9848)
        }

        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }

        let name = locationTextField.text ?? ""
        let photo = photoImageView.image
        let rating = ratingControl.rating

        // Set the location to be passed to the LocationTableViewController after the unwind segue.
        location = Location(name: name, rating: rating, photo: photo)
    }

    //MARK: Actions

    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        // Hide the keyboard in case the user tapped the image while typing in the text field.
        locationTextField.resignFirstResponder()

        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()

        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary

        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }

    @IBAction func openMapView(_ sender: UIButton) {
        
    }

    //MARK: Private Methods

    private func updateSaveButtonState() {
        // Disable the Save button if the text field is empty.
        let text = locationTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
}

