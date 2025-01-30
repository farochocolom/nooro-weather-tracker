//
//  CityCardView.swift
//  nooro-weather-tracker
//
//  Created by Fernando Arocho on 1/30/25.
//

import SwiftUI

struct CityCardView: View {
    @EnvironmentObject private var viewModel: WeatherViewModel
    let city: String
    let temperature: Int
    var body: some View {
        HStack {
            VStack {
                Text(city)
                HStack {
                    Text("\(temperature)")
                    Text("°")
                }
            }
            
            Image(systemName: "sun.max.fill")
                .imageScale(.large)
                .frame(width: 80, height: 80)
        }
    }
}

#Preview {
    CityCardView(city: "Mumbai", temperature: 20)
}
