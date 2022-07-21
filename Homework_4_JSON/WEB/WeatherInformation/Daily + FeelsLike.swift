//
//  FeelsLike.swift
//  Homework_4_JSON
//
//  Created by Александр Борисов on 20.07.2022.
//

import Foundation

struct FeelsLike: Decodable, ProtocolToCelsius {

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        let feelsLikeTampDay = try container.decode(Double.self, forKey: .day)
        day = FeelsLike.inKelvin(feelsLikeTampDay)

        let feelsLikeTampNight = try container.decode(Double.self, forKey: .night)
        night = FeelsLike.inKelvin(feelsLikeTampNight)

        let feelsLikeTampEve = try container.decode(Double.self, forKey: .eve)
        eve = FeelsLike.inKelvin(feelsLikeTampEve)

        let feelsLikeTampMorn = try container.decode(Double.self, forKey: .morn)
        morn = FeelsLike.inKelvin(feelsLikeTampMorn)

    }

    let day: Double
    let night: Double
    let eve: Double
    let morn: Double

    enum CodingKeys: String, CodingKey {
        case day
        case night
        case eve
        case morn
    }
}

