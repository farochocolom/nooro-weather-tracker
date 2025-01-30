//
//  ContentView.swift
//  nooro-weather-tracker
//
//  Created by Fernando Arocho on 1/27/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = WeatherViewModel()
    @State private var searchText = ""
    @State private var searchIsActive = false

    var body: some View {
        NavigationStack {
            VStack {
                AsyncImage(url: URL(string: viewModel.weatherData?.currentData.condition.iconURL ?? "")) { image in
                    image.resizable()
                } placeholder: {
                    Image(systemName: "sun.max.fill")
                        .imageScale(.large)
                }
                .frame(width: 123, height: 113)
                Text(viewModel.weatherData?.city.name ?? "")
                    .font(Font.custom("Poppins", fixedSize: 30))
                if let temperature = viewModel.weatherData?.currentData.temperature {
                    Text("\(Int(temperature))°")
                        .font(Font.custom("Poppins", fixedSize: 70))
                }
            }
            .searchable(text: $searchText, isPresented: $searchIsActive)
        }
        .padding()
        .onAppear {
            Task {
                try await viewModel.fetchWeatherData()
            }
        }
        .onChange(of: searchText, initial: true) { oldValue, newValue in
            searchIsActive = true
            Task {
                try await viewModel.fetchCities(from: newValue)
            }
        }
    }
}

#Preview {
    ContentView()
}
