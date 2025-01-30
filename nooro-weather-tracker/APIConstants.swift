//
//  APIConstants.swift
//  nooro-weather-tracker
//
//  Created by Fernando Arocho on 1/29/25.
//

import Foundation

struct APIConstants {
    static var baseurl: String = "api.weatherapi.com"
    static var currentWeatherPath: String = "/v1/current.json"
    static var searchPath: String = "/v1/search.json"
    static var apiKey: String = "77ae66937caa4bf689a145157252701"
    
    static func currentWeatherURL(with city: String) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = baseurl
        components.path = currentWeatherPath
        components.queryItems = [
            URLQueryItem(name: "key", value: apiKey),
            URLQueryItem(name: "q", value: city),
            URLQueryItem(name: "aqi", value: "no")
        ]
        
        return components.url
    }
    
    static func searchURL(with substring: String) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = baseurl
        components.path = searchPath
        components.queryItems = [
            URLQueryItem(name: "key", value: apiKey),
            URLQueryItem(name: "q", value: substring)
        ]
        
        return components.url
    }
}
