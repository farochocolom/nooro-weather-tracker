//
//  WeatherViewModel.swift
//  nooro-weather-tracker
//
//  Created by Fernando Arocho on 1/27/25.
//

import SwiftUI

class WeatherViewModel: ObservableObject {
    @Published var weatherData: Weather?
    @Published var cityName: String = "New Haven"
    @Published var searchedCities = [City]()
    private let weatherService = WeatherService()

    func fetchWeatherData() async throws {
        weatherData = try await weatherService.fetchWeather(for: cityName)
    }
    
    func fetchCities(from text: String) async throws {
        searchedCities = try await weatherService.searchLocations(withSubstring: text)
    }
}
