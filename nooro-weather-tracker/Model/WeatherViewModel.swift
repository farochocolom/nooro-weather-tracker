//
//  WeatherViewModel.swift
//  nooro-weather-tracker
//
//  Created by Fernando Arocho on 1/27/25.
//

import SwiftUI

class WeatherViewModel: ObservableObject {
    @Published var weatherData: Weather?
    @Published var searchedCities = [City]()
    @Published var selectedCity: City?
    private let weatherService = WeatherService()

    func fetchWeatherData() async throws {
        let fetchedData = try await weatherService.fetchWeather(for: selectedCity?.name ?? "")
        await MainActor.run {
            weatherData = fetchedData
        }
    }
    
    func fetchCities(from text: String) async throws {
        let fetchedData = try await weatherService.searchLocations(withSubstring: text)
        await MainActor.run {
            searchedCities = fetchedData
        }
    }
}
