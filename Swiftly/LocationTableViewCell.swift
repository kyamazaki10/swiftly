//
//  LocationTableViewCell.swift
//  Swiftly
//
//  Created by Kumiko Yamazaki on 5/4/18.
//

import UIKit

class LocationTableViewCell: UITableViewCell {

    //MARK: Properties

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
