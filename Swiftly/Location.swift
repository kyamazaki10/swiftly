//
//  Location.swift
//  Swiftly
//
//  Created by Kumiko Yamazaki on 5/3/18.
//

import UIKit
import os.log

class Location: NSObject, NSCoding {

    //MARK: Properties

    var name: String
    var rating: Int
    var photo: UIImage?

    struct PropertyKey {
        static let name = "name"
        static let rating = "rating"
        static let photo = "photo"
    }

    //MARK: Archiving Paths

    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("locations")

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

    //MARK: NSCoding

    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(rating, forKey: PropertyKey.rating)
        aCoder.encode(photo, forKey: PropertyKey.photo)
    }

    required convenience init?(coder aDecoder: NSCoder) {
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Location object.", log: OSLog.default, type: .debug)
            return nil
        }

        // Because photo is an optional property of Location, just use conditional cast.
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage

        let rating = aDecoder.decodeInteger(forKey: PropertyKey.rating)

        // Must call designated initializer.
        self.init(name: name, rating: rating, photo: photo)
    }
}
