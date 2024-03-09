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
    
    static func ratinghelper(rating: Double) -> String {
        
        switch rating {
        case 0.0..<0.49:
            return "0.0"
        case 0.5..<1.49:
            return "1.0"
        case 1.50..<1.99:
            return "1.5"
        case 2.00..<2.49:
            return "2.0"
        case 2.50..<2.99:
            return "2.5"
        case 3.00..<3.49:
            return "3.0"
        case 3.5..<3.99:
            return "3.5"
        case 4.0..<4.49:
            return "4.0"
        case 4.5..<4.75:
            return "4.5"
        case 4.74..<5.01:
            return "5.0"
            
            
        default: "5.0"
        }
        
        
        
        if rating > 4.49 && rating < 4.99 {
            return "4.5"
        } else
        {
            return "5.0"
        }
    }
}
