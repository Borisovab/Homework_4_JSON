//
//  Hourly.swift
//  Homework_4_JSON
//
//  Created by Александр Борисов on 20.07.2022.
//

import Foundation

struct Hourly: Decodable, ProtocolToCelsius {

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        let dateSince = try container.decode(Int.self, forKey: .dt)
        dt = Date(timeIntervalSince1970: TimeInterval(dateSince))

        let hourlyTemp = try container.decode(Double.self, forKey: .temp)
        temp = Hourly.inKelvin(hourlyTemp)

        let hourlyFeelsLike = try container.decode(Double.self, forKey: .feelsLike)
        feelsLike = Hourly.inKelvin(hourlyFeelsLike)

        pressure = try container.decode(Int.self, forKey: .pressure)
        humidity = try container.decode(Int.self, forKey: .humidity)

        let hourlyDewPoint = try container.decode(Double.self, forKey: .dewPoint)
        dewPoint = Hourly.inKelvin(hourlyDewPoint)

        uvi = try container.decode(Double.self, forKey: .uvi)
        clouds = try container.decode(Int.self, forKey: .clouds)
        visibility = try container.decode(Int.self, forKey: .visibility)
        windSpeed = try container.decode(Double.self, forKey: .windSpeed)
        windDeg = try container.decode(Int.self, forKey: .windDeg)
        windGust = try container.decode(Double.self, forKey: .windGust)
        weather = try container.decode([Weather].self, forKey: .weather)
        pop = try container.decode(Int.self, forKey: .pop)
    }

    let dt: Date
    let temp: Double
    let feelsLike: Double
    let pressure: Int
    let humidity: Int
    let dewPoint: Double
    let uvi: Double
    let clouds: Int
    let visibility: Int
    let windSpeed: Double
    let windDeg: Int
    let windGust: Double
    let weather: [Weather]
    let pop: Int

    enum CodingKeys: String, CodingKey {
        case dt
        case temp
        case feelsLike = "feels_like"
        case pressure
        case humidity
        case dewPoint = "dew_point"
        case uvi
        case clouds
        case visibility
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case windGust = "wind_gust"
        case weather
        case pop
    }
}

