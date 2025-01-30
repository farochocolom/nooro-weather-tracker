//
//  City.swift
//  nooro-weather-tracker
//
//  Created by Fernando Arocho on 1/28/25.
//

import Foundation

struct City: Decodable, Identifiable, Hashable {
    let id: Int
    let name: String
    let region: String
    let country: String
}
