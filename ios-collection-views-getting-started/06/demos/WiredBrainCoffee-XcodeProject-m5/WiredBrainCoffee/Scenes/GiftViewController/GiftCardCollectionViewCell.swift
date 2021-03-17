//
//  GiftCardCollectionViewCell.swift
//  WiredBrainCoffee
//
//  Created by Johnny Soto on 3/17/21.
//  Copyright © 2021 Mark Moeykens. All rights reserved.
//

import UIKit

class GiftCardCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var giftCardImageView: UIImageView!
    // adding cell dropshadow
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 10
        giftCardImageView.layer.cornerRadius = layer.cornerRadius
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 1, height: 1)
    }
    
    func setup(giftCardModel: GiftCardModel) {
        giftCardImageView.image = giftCardModel.image
    }
}
