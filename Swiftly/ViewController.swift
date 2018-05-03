//
//  ViewController.swift
//  Swiftly
//
//  Created by Kumiko Yamazaki on 3/12/18.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //MARK: Properties
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var locationTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Handle the text field's user input through delegate callbacks.
        locationTextField.delegate = self
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

    func textFieldDidEndEditing(_ textField: UITextField) {
        locationLabel.text = textField.text
    }

    //MARK: Actions
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        locationLabel.text = "Default Text"
    }
}

