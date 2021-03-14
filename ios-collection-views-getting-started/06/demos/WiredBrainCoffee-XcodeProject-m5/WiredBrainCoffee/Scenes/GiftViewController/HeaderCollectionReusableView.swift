//
//  HeaderCollectionReusableView.swift
//  WiredBrainCoffee
//
//  Created by Mark Moeykens on 4/30/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    @IBOutlet weak var headerLabel: UILabel!
    
    func setup(count: Int) {
        headerLabel.text = "Colors: \(count)"
    }
}
