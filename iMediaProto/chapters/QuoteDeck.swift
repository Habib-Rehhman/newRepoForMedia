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
        Quote(text: "",
              tags: [ "Chapter 1"]),
        Quote(text: "",
              tags: [ "ملكففححخ"]),
        Quote(text: "",
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
