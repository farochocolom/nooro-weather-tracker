//
//  WeatherData.swift
//  nooro-weather-tracker
//
//  Created by Fernando Arocho on 1/27/25.
//

import Foundation

struct WeatherData: Codable {
    let temperature: Double
//    let condition: String
    let humidity: Int
    let uvIndex: Double
    let feelsLike: Double
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp_f"
//        case condition
        case humidity
        case uvIndex = "uv"
        case feelsLike = "feelslike_f"
    }
    
//    - City name.
//    - Temperature.
//    - Weather condition (with corresponding icon from the API).
//    - Humidity (%).
//    - UV index.
//    - "Feels like" temperature.
}

struct Weather: Codable {
    let currentData: WeatherData
    let city: City
    
    enum CodingKeys: String, CodingKey {
        case currentData = "current"
        case city = "location"
    }
}
