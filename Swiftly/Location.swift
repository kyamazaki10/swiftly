//
//  Location.swift
//  Swiftly
//
//  Created by Kumiko Yamazaki on 5/3/18.
//

import UIKit

class Location {

    //MARK: Properties
    var name: String
    var rating: Int
    var photo: UIImage?

    //MARK: Initialization
    init?(name: String, rating: Int, photo: UIImage?) {
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty || rating < 0 {
            return nil
        }

        // Initialize stored properties.
        self.name = name
        self.rating = rating
        self.photo = photo
    }
}
