//
//  Daily.swift
//  Homework_4_JSON
//
//  Created by Александр Борисов on 20.07.2022.
//

import Foundation

struct Daily: Decodable, ProtocolToCelsius {

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        let dateSince = try container.decode(Int.self, forKey: .dt)
        dt = Date(timeIntervalSince1970: TimeInterval(dateSince))

        let dateSunrise = try container.decode(Int.self, forKey: .sunrise)
        sunrise = Date(timeIntervalSince1970: TimeInterval(dateSunrise))

        let dateSunset = try container.decode(Int.self, forKey: .sunset)
        sunset = Date(timeIntervalSince1970: TimeInterval(dateSunset))

        let dateMoonrise = try container.decode(Int.self, forKey: .moonrise)
        moonrise = Date(timeIntervalSince1970: TimeInterval(dateMoonrise))

        let dateMoonset = try container.decode(Int.self, forKey: .moonset)
        moonset = Date(timeIntervalSince1970: TimeInterval(dateMoonset))

        moonPhase = try container.decode(Double.self, forKey: .moonPhase)
        temp = try container.decode(Temp.self, forKey: .temp)
        feelsLike = try container.decode(FeelsLike.self, forKey: .feelsLike)
        pressure = try container.decode(Int.self, forKey: .pressure)
        humidity = try container.decode(Int.self, forKey: .humidity)

        let dailyDewPoint = try container.decode(Double.self, forKey: .dewPoint)
        dewPoint = Daily.inKelvin(dailyDewPoint)

        windSpeed = try container.decode(Double.self, forKey: .windSpeed)
        windDeg = try container.decode(Int.self, forKey: .windDeg)
        weather = try container.decode([Weather].self, forKey: .weather)
        clouds = try container.decode(Int.self, forKey: .clouds)
        pop = try container.decode(Double.self, forKey: .pop)
        rain = try container.decode(Double.self, forKey: .rain)
        uvi = try container.decode(Double.self, forKey: .uvi)
    }

    let dt: Date
    let sunrise: Date
    let sunset: Date
    let moonrise: Date
    let moonset: Date
    let moonPhase: Double
    let temp: Temp
    let feelsLike: FeelsLike
    let pressure: Int
    let humidity: Int
    let dewPoint: Double
    let windSpeed: Double
    let windDeg: Int
    let weather: [Weather]
    let clouds: Int
    let pop: Double
    let rain: Double
    let uvi: Double

    enum CodingKeys: String, CodingKey {
        case dt
        case sunrise
        case sunset
        case moonrise
        case moonset
        case moonPhase = "moon_phase"
        case temp
        case feelsLike = "feels_like"
        case pressure
        case humidity
        case dewPoint = "dew_point"
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather
        case clouds
        case pop
        case rain
        case uvi
    }


}

