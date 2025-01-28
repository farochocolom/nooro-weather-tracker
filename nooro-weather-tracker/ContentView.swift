//
//  ContentView.swift
//  nooro-weather-tracker
//
//  Created by Fernando Arocho on 1/27/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = WeatherViewModel()
    var body: some View {
        VStack {
            
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("\(viewModel.weatherData?.currentData.temperature)")
        }
        .padding()
        .onAppear {
            viewModel.fetchUsers()
        }
    }
}

#Preview {
    ContentView()
}
