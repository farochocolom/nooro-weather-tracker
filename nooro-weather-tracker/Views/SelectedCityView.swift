//
//  SelectedCityView.swift
//  nooro-weather-tracker
//
//  Created by Fernando Arocho on 1/30/25.
//

import SwiftUI

struct SelectedCityView: View {
    @EnvironmentObject private var viewModel: WeatherViewModel
    
    var body: some View {
        AsyncImage(url: URL(string: viewModel.weatherData?.currentData.condition.iconURL ?? "")) { image in
            image.resizable()
        } placeholder: {
            Image(systemName: "sun.max.fill")
                .imageScale(.large)
        }
        .frame(width: 123, height: 113)
        Text(viewModel.weatherData?.city.name ?? "City")
            .font(Font.custom("Poppins", fixedSize: 30))
        if let temperature = viewModel.weatherData?.currentData.temperature {
            Text("\(Int(temperature))°")
                .font(Font.custom("Poppins", fixedSize: 70))
        }
    }
}

#Preview {
    SelectedCityView()
}
