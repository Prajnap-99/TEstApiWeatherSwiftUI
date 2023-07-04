//
//  WeatherModal.swift
//  TEstApiWeather
//
//  Created by Prajna P on 01/05/23.
//

import Foundation

struct WeatherModal: Codable {
    let coord: Coord
    let weather: [Weather]
    let main: WeatherMain
    let sys: Sys
    let dt: Date
    let id: Int
    let name: String
    let base: String
}

struct Coord: Codable {
    let lon: Double
    let lat: Double
}

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
    var weatherIconURL: URL {
        let urlString = "http://openweathermap.org/img/wn/\(icon)@2x.png"
        return URL(string: urlString)!
    }
}

struct WeatherMain: Codable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
    let sea_level: Int
    let grnd_level: Int
}

struct Sys: Codable {
    let country: String
    let sunrise: Int
    let sunset: Int
}
