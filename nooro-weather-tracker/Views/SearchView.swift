//
//  SearchView.swift
//  nooro-weather-tracker
//
//  Created by Fernando Arocho on 1/30/25.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject private var viewModel: WeatherViewModel
    var body: some View {
        List(viewModel.searchedCities, selection: $viewModel.selectedCity) { city in
            CityCardView(city: city.name, temperature: 20)
                .listRowSeparator(.hidden)
                .onTapGesture {
                    viewModel.selectedCity = city
                }
        }
        .listStyle(.plain)
        .background(Color.white)
    }
}

#Preview {
    SearchView()
        .environmentObject(WeatherViewModel())
}
