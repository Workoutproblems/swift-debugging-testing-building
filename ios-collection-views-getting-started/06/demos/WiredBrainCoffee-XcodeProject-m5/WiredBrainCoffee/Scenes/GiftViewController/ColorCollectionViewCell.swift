//
//  ColorCollectionViewCell.swift
//  WiredBrainCoffee
//
//  Created by Johnny Soto on 3/16/21.
//  Copyright © 2021 Mark Moeykens. All rights reserved.
//

import UIKit

class ColorCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var numberLabel: UILabel!
    // pass in all the data for cell to format
    func setup(backgroundColor: UIColor, cellNumber: Int) {
        self.backgroundColor = backgroundColor
        numberLabel.text = "\(cellNumber)"
    }
}
