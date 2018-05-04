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
        // The name must not be empty.
        guard !name.isEmpty else {
            return nil
        }

        // The rating must be between 0 and 5 inclusively.
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }

        // Initialize stored properties.
        self.name = name
        self.rating = rating
        self.photo = photo
    }
}
