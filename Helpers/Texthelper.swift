//
//  Texthelper.swift
//  CitySites
//
//  Created by Joe Miehl on 2/17/24.
//

import Foundation

struct Texthelper {
    static func distanceAwayText(meters: Double) -> String {
        if meters > 1000 {
            return "\(Int(round(meters/1609.34))) miles away"
            
        }
        else {
            return "\(Int(round(meters/0.3048))) feet away"
            
        }
    }
}
