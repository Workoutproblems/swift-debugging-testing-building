//
//  HeaderCollectionReusableView.swift
//  WiredBrainCoffee
//
//  Created by Johnny Soto on 3/16/21.
//  Copyright © 2021 Mark Moeykens. All rights reserved.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    @IBOutlet weak var headerLabel: UILabel!
    func setup(count: Int){
        headerLabel.text = "Colors: \(count)"
    }
}
