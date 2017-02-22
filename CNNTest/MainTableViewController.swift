//
//  MainTableViewController.swift
//  CNNTest
//
//  Created by Mark Meyer on 2/21/17.
//  Copyright © 2017 Sharethrough. All rights reserved.
//

import UIKit

struct slotConfig {
    var index: Int
    var rendered: Bool
    var creativeKey: String
}

class MainTableViewController: UITableViewController, STRAdViewDelegate {

    var adIndicesAndRendered: [Int: slotConfig] = [2: slotConfig(index: 2, rendered: false, creativeKey: "DS6Paq7XsQCaU49E5YgXN3f8iU"),
                                                   5: slotConfig(index: 5, rendered: false, creativeKey: "DSyQKpLqT62BnfRzyDTtwRfy14")]
    let placementKey = "dmRew21qJPEBBruUxX91tPUd"

    override func viewDidLoad() {
        super.viewDidLoad()
//        SharethroughSDK.enableDebugLogging()
        fetchAndAssignAd(slot: adIndicesAndRendered[2]!)
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
        return 8
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ExampleTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ExampleTableViewCell

        if (SharethroughSDK.sharedInstance().isAdAvailable(forPlacement: placementKey, at: indexPath.row)) {
            SharethroughSDK.sharedInstance().placeAd(in: cell, placementKey: placementKey, presenting: self, index: indexPath.row, customProperties: nil, delegate: self)
        } else {
            cell.largeImageView.image = UIImage(named: "PlaceholderImage")
            cell.titleLabel.text = "Cell: \(indexPath.row)"
            cell.longLabel.text = ""
        }

        return cell
    }

    func fetchAndAssignAd(slot: slotConfig) {
        let cell = ExampleTableViewCell()
        SharethroughSDK.sharedInstance().placeAd(in: cell, placementKey: placementKey, presenting: self, index: slot.index, customProperties: ["sharethrough_creative_key": slot.creativeKey], delegate: self)
    }

    func adView(_ adView: STRAdView!, didFetchAd ad: STRAdvertisement!, forPlacementKey placementKey: String!, at adIndex: Int) {
        print("Index: \(adIndex) Title: \(ad.title)")
        if (adIndicesAndRendered[adIndex]!.rendered == false) {
            adIndicesAndRendered[adIndex]!.rendered = true
            tableView.reloadData()
        }
        if (!SharethroughSDK.sharedInstance().isAdAvailable(forPlacement: placementKey, at: 5)) {
            fetchAndAssignAd(slot: adIndicesAndRendered[5]!)
        }
    }

}
