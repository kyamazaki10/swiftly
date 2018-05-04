//
//  SwiftlyTests.swift
//  SwiftlyTests
//
//  Created by Kumiko Yamazaki on 3/12/18.
//

import XCTest
@testable import Swiftly

class SwiftlyTests: XCTestCase {

    //MARK: Location Class Tests

    // Confirm that the Location initializer returns a Location object when passed valid parameters.
    func testLocationInitializationSucceeds() {
        // Zero rating.
        let zeroRatingLocation = Location.init(name: "Zero", rating: 0, photo: nil)
        XCTAssertNotNil(zeroRatingLocation)

        // Highest positive rating.
        let positiveRatingLocation = Location.init(name: "Positive", rating: 5, photo: nil)
        XCTAssertNotNil(positiveRatingLocation)
    }

    // Confirm that the Location initializer returns nil when passed a negative rating or an empty name.
    func testLocationInitializationFails() {
        // Negative rating.
        let negativeRatingLocation = Location.init(name: "Negative", rating: -1, photo: nil)
        XCTAssertNil(negativeRatingLocation)

        // Exceeds maximum rating.
        let largeRatingLocation = Location.init(name: "Large", rating: 6, photo: nil)
        XCTAssertNil(largeRatingLocation)

        // Empty string.
        let emptyStringLocation = Location.init(name: "", rating: 0, photo: nil)
        XCTAssertNil(emptyStringLocation)
    }
}
