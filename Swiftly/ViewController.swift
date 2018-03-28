//
//  ViewController.swift
//  Swiftly
//
//  Created by Kumiko Yamazaki on 3/12/18.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var locationTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Actions
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        locationLabel.text = "Default Text"
    }
}

