//
//  SmallGiftCardCollectionViewDataSource.swift
//  WiredBrainCoffee
//
//  Created by Johnny Soto on 3/18/21.
//  Copyright © 2021 Mark Moeykens. All rights reserved.
//

import UIKit

class SmallGiftCardCollectionViewDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // returns how many gift cards in an array
    fileprivate var giftCards = [GiftCardModel]()
    
    // initializer for class, accepts array of G.C. models
    init(giftCards: [GiftCardModel]) {
        self.giftCards = giftCards
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return giftCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GiftCardCell", for: indexPath) as! GiftCardCollectionViewCell
        cell.setup(giftCardModel: giftCards[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.bounds.width / 2 - 50
        let height = width / 1.5
        return CGSize(width: width, height: height)
    }
}
