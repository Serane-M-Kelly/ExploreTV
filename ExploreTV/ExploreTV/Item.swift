//
//  Item.swift
//  ExploreTV
//
//  Created by Keliane Serane Moayé Kossa on 30/06/2026.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
