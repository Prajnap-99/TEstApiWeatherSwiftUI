//
//  ContentView.swift
//  TEstApiWeather
//
//  Created by Prajna P on 01/05/23.
//

import SwiftUI

struct ContentView: View {
    @State var city = ""
    @State private var weatherData: WeatherModal?
    
    private let apiClient = WeatherAPIClient()
    
    var body: some View {
        VStack {
            TextField("Enter a city name", text: $city)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Get WEATHER") {
                apiClient.fetchWeatherData(forCity: city) { result in
                    switch result {
                    case .success(let weatherData):
                        self.weatherData = weatherData
                        print(weatherData)
                    case .failure(let error):
                        print(error)
                    }
                }
            }
            
            if let weatherData = weatherData {
                Text(weatherData.weather.description)
                    .font(.title)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
