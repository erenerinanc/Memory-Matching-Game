//
//  CardCell.swift
//  Day99Challange
//
//  Created by Eren Erinanc on 14.05.2021.
//

import UIKit

class CardCell: UICollectionViewCell {
    @IBOutlet var frontImageView: UIImageView!
    @IBOutlet var backImageView: UIImageView!
    
    var card: Card?
    
    func setCard(_ card: Card) {
//        Keep track of the card that gets passed in 
        self.card = card
        
        let path = Bundle.main.path(forResource: "\(card.imageName).png", ofType: nil)!
        frontImageView.image = UIImage(contentsOfFile: path)
               
        
        if card.isFlipped {

            UIView.transition(from: backImageView, to: frontImageView, duration: 0, options: [.transitionFlipFromRight, .showHideTransitionViews])
        } else {

            UIView.transition(from: frontImageView, to: backImageView, duration: 0, options: [.transitionFlipFromRight, .showHideTransitionViews])
        }
    }
        
    
    func flip() {
        let transitionOption: UIView.AnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
        
        UIView.transition(from: backImageView, to: frontImageView, duration: 0.3, options: transitionOption)

    }
    
    func flipBack() {

        let transitionOption: UIView.AnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]

        UIView.transition(from: frontImageView, to: backImageView, duration: 0.3, options: transitionOption)
    }
    
    func remove() {
//        // TODO: Animate it
        frontImageView.alpha = 0
        backImageView.alpha = 0

    }
    
}
