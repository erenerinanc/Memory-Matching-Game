//
//  ViewController.swift
//  Day99Challange
//
//  Created by Eren Erinanc on 12.05.2021.
//

import UIKit

class ViewController: UICollectionViewController {
    
    var cards = [Card]()
    var model = CardModel()
    
    var firstFlippedCardIndex: IndexPath?
    
    var flippedCardCells = [CardCell]()
    
    var matchedCardCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cards = model.getCards()
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Card", for: indexPath) as! CardCell
        cell.setCard(cards[indexPath.row])
        
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("Cell \(indexPath.row) tapped")
        
        let cell = collectionView.cellForItem(at: indexPath) as! CardCell
        
        let card = cards[indexPath.row]
        
        //Check if the user did not select more than 2 cards
        //Check the cards are not matched
        //Check the cards are not flipped
        print(flippedCardCells.count)
        if flippedCardCells.count < 2 {
            cell.flip()
            card.isFlipped = true
            
            //Add the selected cards to the array of cells
            flippedCardCells.append(cell)
        
            //Wait for 2 seconds, and then flip the cards back
    
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
                if card.isMathced == false {
                    cell.flipBack()
                    card.isFlipped = false
                    
                    // When they are flipped back, remove them from the array
                    if let index = self?.flippedCardCells.firstIndex(of: cell) {
                        self?.flippedCardCells.remove(at: index)
                    }
                }
            }
            
            // Check if we have 2 flipped cards on the screen
            if flippedCardCells.count == 2 {
                //Get the cards of the cells
                let flippedCard1 = flippedCardCells[0].card
                let flippedCard2 = flippedCardCells[1].card
                
                //Check if the cards are the same
                if flippedCard1?.imageName == flippedCard2?.imageName {
                    //Mark them as matched
                    flippedCard1?.isMathced = true
                    flippedCard2?.isMathced = true
                    
                    matchedCardCounter += 2
                    
                    //Remove them from the flipped card array
                    flippedCardCells[0].remove()
                    flippedCardCells[1].remove()
                    flippedCardCells = [CardCell]()
                    
                    if matchedCardCounter == 16 {
                        let ac = UIAlertController(title: "YOU WIN!", message: nil, preferredStyle: .alert)
                        present(ac, animated: true)
                    }

                }
            }
        }
    }
    
    
    
    
}  // End of ViewController Class

