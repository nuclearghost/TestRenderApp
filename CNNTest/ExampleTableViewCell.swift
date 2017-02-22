//
//  ExampleTableViewCell.swift
//  CNNTest
//
//  Created by Mark Meyer on 2/21/17.
//  Copyright © 2017 Sharethrough. All rights reserved.
//

import UIKit


class ExampleTableViewCell: UITableViewCell, STRAdView  {

    @IBOutlet weak var largeImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var longLabel: UILabel!

    public func adTitle() -> UILabel! {
        return longLabel
    }

    public func adThumbnail() -> UIImageView! {
        return largeImageView
    }

    public func adSponsoredBy() -> UILabel! {
        return titleLabel
    }

    public func disclosureButton() -> UIButton! {
        return UIButton(type: .detailDisclosure)
    }

    public func thumbnailWidth() -> UInt {
        return 359
    }

    public func thumbnailHeight() -> UInt {
        return 242
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
