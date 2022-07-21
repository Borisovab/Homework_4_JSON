//
//  Alerts.swift
//  Homework_4_JSON
//
//  Created by Александр Борисов on 20.07.2022.
//

import Foundation

struct Alerts: Decodable {

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        senderName = try container.decode(String.self, forKey: .senderName)
        event = try container.decode(String.self, forKey: .event)

        let dateStart = try container.decodeIfPresent(Int.self, forKey: .start)
        start = Date(timeIntervalSince1970: TimeInterval(dateStart ?? 0))

        let dateEnd = try container.decodeIfPresent(Int.self, forKey: .end)
        end = Date(timeIntervalSince1970: TimeInterval(dateEnd ?? 0))

        description = try container.decode(String.self, forKey: .description)
        tags = try container.decode([String].self, forKey: .tags)
    }

    let senderName: String
    let event: String
    let start: Date?
    let end: Date?
    let description: String
    let tags: [String]


    enum CodingKeys: String, CodingKey {
        case senderName = "sender_name"
        case event
        case start
        case end
        case description
        case tags
    }
}
