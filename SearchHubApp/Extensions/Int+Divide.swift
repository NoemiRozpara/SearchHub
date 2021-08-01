//
//  Int+Divide.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 1/8/21.
//

import Foundation

extension Int {
    /// Converts two Ints to Double, divides, rounds up and returns Int 
    static func divideRoundUp(_ a: Int, _ b: Int) -> Int {
        let rounded = round(Double(a) / Double(b))
        return Int(rounded)
    }
}
