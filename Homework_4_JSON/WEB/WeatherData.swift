//
//  WeatherData.swift
//  Homework_4_JSON
//
//  Created by Александр Борисов on 20.07.2022.
//

import Foundation

struct WeatherData: Decodable {

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        lat = try container.decode(Double.self, forKey: .lat)
        lon = try container.decode(Double.self, forKey: .lon)
        timezone = try container.decode(String.self, forKey: .timezone)
        timezoneOffset = try container.decode(Int.self, forKey: .timezoneOffset)
        current = try container.decode(Current.self, forKey: .current)
        minutely = try container.decode([Minutely].self, forKey: .minutely)
        hourly = try container.decode([Hourly].self, forKey: .hourly)
        daily = try container.decode([Daily].self, forKey: .daily)
        alerts = try container.decode([Alerts].self, forKey: .alerts)
    }

    let lat: Double
    let lon: Double
    let timezone: String
    let timezoneOffset: Int
    let current: Current
    let minutely: [Minutely]
    let hourly: [Hourly]
    let daily: [Daily]
    let alerts: [Alerts]


    enum CodingKeys: String, CodingKey {
        case lat
        case lon
        case timezone
        case timezoneOffset = "timezone_offset"
        case current
        case minutely
        case hourly
        case daily
        case alerts
    }
}
