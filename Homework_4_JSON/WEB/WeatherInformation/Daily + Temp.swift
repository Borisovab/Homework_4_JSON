//
//  Temp.swift
//  Homework_4_JSON
//
//  Created by Александр Борисов on 20.07.2022.
//

import Foundation

struct Temp: Decodable, ProtocolToCelsius {

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        let dailyTampDay = try container.decode(Double.self, forKey: .day)
        day = Temp.inKelvin(dailyTampDay)

        let dailyTampMin = try container.decode(Double.self, forKey: .min)
        min = Temp.inKelvin(dailyTampMin)

        let dailyTampMax = try container.decode(Double.self, forKey: .max)
        max = Temp.inKelvin(dailyTampMax)

        let dailyTampNight = try container.decode(Double.self, forKey: .night)
        night = Temp.inKelvin(dailyTampNight)

        let dailyTampEve = try container.decode(Double.self, forKey: .eve)
        eve = Temp.inKelvin(dailyTampEve)

        let dailyTampMorn = try container.decode(Double.self, forKey: .morn)
        morn = Temp.inKelvin(dailyTampMorn)

    }

    let day: Double
    let min: Double
    let max: Double
    let night: Double
    let eve: Double
    let morn: Double

    enum CodingKeys: String, CodingKey {
        case day
        case min
        case max
        case night
        case eve
        case morn
    }
}

