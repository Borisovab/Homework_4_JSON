//
//  Minutely.swift
//  Homework_4_JSON
//
//  Created by Александр Борисов on 20.07.2022.
//

import Foundation

struct Minutely: Decodable {

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        let dateSince = try container.decode(Int.self, forKey: .dt)
        dt = Date(timeIntervalSince1970: TimeInterval(dateSince))

        precipitation = try container.decode(Double.self, forKey: .precipitation)
    }

    let dt: Date
    let precipitation: Double

    enum CodingKeys: String, CodingKey {
        case dt
        case precipitation
    }
}
