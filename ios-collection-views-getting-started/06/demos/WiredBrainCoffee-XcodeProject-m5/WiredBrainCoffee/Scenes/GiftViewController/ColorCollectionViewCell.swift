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
    // adding cell dropshadow
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 10
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 1, height: 1)
    }
    
    // pass in all the data for cell to format
    func setup(backgroundColor: UIColor, cellNumber: Int) {
        self.backgroundColor = backgroundColor
        numberLabel.text = "\(cellNumber)"
    }
}
