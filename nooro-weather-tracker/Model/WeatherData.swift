//
//  WeatherData.swift
//  nooro-weather-tracker
//
//  Created by Fernando Arocho on 1/27/25.
//

import Foundation

struct WeatherData: Decodable {
    let temperature: Double
    let condition: Condition
    let humidity: Int
    let uvIndex: Double
    let feelsLike: Double
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp_f"
        case condition
        case humidity
        case uvIndex = "uv"
        case feelsLike = "feelslike_f"
    }
}

struct Condition: Decodable {
    let text: String
    let icon: URL
    
    var iconURL: String? {
        var components = URLComponents(url: icon, resolvingAgainstBaseURL: false)
        components?.scheme = "https"
        // increasing resolution
        return components?.string?.replacingOccurrences(of: "64x64", with: "128x128")
    }
}

struct Weather: Decodable {
    let currentData: WeatherData
    let city: City
    
    enum CodingKeys: String, CodingKey {
        case currentData = "current"
        case city = "location"
    }
}
