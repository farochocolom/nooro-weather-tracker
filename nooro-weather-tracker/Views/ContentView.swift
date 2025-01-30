//
//  ContentView.swift
//  nooro-weather-tracker
//
//  Created by Fernando Arocho on 1/27/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var viewModel: WeatherViewModel
    @State private var searchText = ""
    @State private var searchIsActive = false
    var body: some View {
        NavigationStack {
            VStack {
                if searchIsActive {
                    SearchView()
                } else if viewModel.selectedCity != nil {
                    SelectedCityView()
                } else {
                    Text("No city selected")
                    Text("Please search for a city")
                }
            }
            .searchable(text: $searchText, isPresented: $searchIsActive, prompt: Text("Search Location"))
        }
        .padding()
        .onAppear {
            Task {
                try await viewModel.fetchWeatherData()
            }
        }
        .onChange(of: viewModel.selectedCity, initial: false) { _, newValue in
            if let _ = newValue {
                searchIsActive = false
                Task {
                    try await viewModel.fetchWeatherData()
                }
            }
        }
        .onChange(of: searchText, initial: false) { oldValue, newValue in
            searchIsActive = true
            Task {
                try await viewModel.fetchCities(from: newValue)
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(WeatherViewModel())
}
