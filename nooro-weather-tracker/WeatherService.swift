//
//  WeatherService.swift
//  nooro-weather-tracker
//
//  Created by Fernando Arocho on 1/29/25.
//

import Foundation

final class WeatherService {
    func fetchWeather(for city: String) async throws -> Weather? {
        guard let url = APIConstants.currentWeatherURL(with: city) else { return nil }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let fetchedData = try JSONDecoder().decode(Weather.self, from: data)
        return fetchedData
    }
    
    func searchLocations(withSubstring substring: String) async throws -> [City] {
        guard let url = APIConstants.searchURL(with: substring) else { return [] }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let fetchedData = try JSONDecoder().decode([City].self, from: data)
        return fetchedData
    }
}
