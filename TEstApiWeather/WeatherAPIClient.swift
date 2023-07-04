//
//  WeatherAPIClient.swift
//  TEstApiWeather
//
//  Created by Prajna P on 01/05/23.
//

import Foundation

class WeatherAPIClient {
    private let apiKey = "61f44f5218522c3f263c679bec372366"
    private let baseURL = "https://api.openweathermap.org/data/2.5/weather"
    
    func fetchWeatherData(forCity city: String, completion: @escaping (Result<WeatherModal, Error>) -> Void) {
        let urlString = "\(baseURL)?q=\(city)&appid=\(apiKey)"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 0, userInfo: nil)))
                return
            }
            do {
                let weatherData = try JSONDecoder().decode(WeatherModal.self, from: data)
                completion(.success(weatherData))
                print(WeatherModal.self)
            } catch let error {
                completion(.failure(error))
            }
        }.resume()
    }
}
