//
//  Quotes.swift
//  Founding Fathers Quote Book
//
//  Created by Steve Liddle on 9/9/16.
//  Copyright © 2016 Steve Liddle. All rights reserved.
//

import UIKit

class Quote {
    
    // MARK: - Properties
    
    var text: String
    var tags: [String]
    
    // MARK: - Initialization
    
    init(text: String, tags: [String]) {
        self.text = text
        self.tags = tags
    }
}
