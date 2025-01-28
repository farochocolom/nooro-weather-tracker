//
//  WeatherViewModel.swift
//  nooro-weather-tracker
//
//  Created by Fernando Arocho on 1/27/25.
//

import SwiftUI

class WeatherViewModel: ObservableObject {
    @Published var weatherData: Weather?

    func fetchUsers() {
        guard let url = URL(string: "https://api.weatherapi.com/v1/current.json?key=77ae66937caa4bf689a145157252701&q=New Haven&aqi=yes") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Weather.self, from: data) {
                    DispatchQueue.main.async {
                        self.weatherData = decodedResponse
                    }
                }
            }
        }.resume()
    }
}
