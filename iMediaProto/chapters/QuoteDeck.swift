//
//  QuoteDeck.swift
//  Founding Fathers Quote Book
//
//  Created by Steve Liddle on 9/9/16.
//  Copyright © 2016 Steve Liddle. All rights reserved.
//

import Foundation

class QuoteDeck {
    
    // MARK: - Properties
    
    var tagSet: [String] = []

    let quotes = [
        Quote(text: "Do you want to know who you are? Don't ask. Act! Action will delineate and define you.",
              tags: [ "Chapter 1"]),
        Quote(text: "Facts are stubborn things; and whatever may be our wishes, our inclinations, or the dictates of our passions, they cannot alter the state of facts and evidence.",
              tags: [ "ملكففححخ"]),
        Quote(text: "Great is the guilt of an unnecessary war.",
              tags: [ "guilt"])
    ]

    // MARK: - Singleton pattern
    
    static let sharedInstance = QuoteDeck()
    
    private init() {
        update()
    }

    // MARK: - Private helpers
    
    private func update() {
        for quote in quotes {
            for tag in quote.tags {
                if !tagSet.contains(tag) {
                    tagSet.append(tag)
                }
            }
        }

        tagSet = tagSet.sorted()
    }

    // MARK: - Public helpers
    
    func quotesForTag(_ tag: String) -> [Quote] {
        var matchingQuotes: [Quote] = []

        for quote in quotes {
            if quote.tags.contains(tag) {
                matchingQuotes.append(quote)
            }
        }
        
        return matchingQuotes
    }
}
