//
//  File.swift
//  Day99Challange
//
//  Created by Eren Erinanc on 14.05.2021.
//

import Foundation

class CardModel {
    
    func getCards() -> [Card] {
        var generatedCardsArray = [Card]()
        
        let card1 = Card()
        let card2 = Card()
        card1.imageName = "beach"
        card2.imageName = "beach"
        generatedCardsArray.append(card1)
        generatedCardsArray.append(card2)

        let card3 = Card()
        let card4 = Card()
        card3.imageName = "coctail"
        card4.imageName = "coctail"
        generatedCardsArray.append(card3)
        generatedCardsArray.append(card4)
        
        let card5 = Card()
        let card6 = Card()
        card5.imageName = "girls"
        card6.imageName = "girls"
        generatedCardsArray.append(card5)
        generatedCardsArray.append(card6)
        
        let card7 = Card()
        let card8 = Card()
        card7.imageName = "icecream"
        card8.imageName = "icecream"
        generatedCardsArray.append(card7)
        generatedCardsArray.append(card8)
        
        let card9 = Card()
        let card10 = Card()
        card9.imageName = "picnic"
        card10.imageName = "picnic"
        generatedCardsArray.append(card9)
        generatedCardsArray.append(card10)
        
        let card11 = Card()
        let card12 = Card()
        card11.imageName = "pool"
        card12.imageName = "pool"
        generatedCardsArray.append(card11)
        generatedCardsArray.append(card12)
        
        let card13 = Card()
        let card14 = Card()
        card13.imageName = "tiger"
        card14.imageName = "tiger"
        generatedCardsArray.append(card13)
        generatedCardsArray.append(card14)
        
        let card15 = Card()
        let card16 = Card()
        card15.imageName = "water"
        card16.imageName = "water"
        generatedCardsArray.append(card15)
        generatedCardsArray.append(card16)
        
        
        generatedCardsArray.shuffle()
        
        return generatedCardsArray
    }
    
    
}
