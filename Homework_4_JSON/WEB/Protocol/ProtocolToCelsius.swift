//
//  ProtocolToCelsius.swift
//  Homework_4_JSON
//
//  Created by Александр Борисов on 21.07.2022.
//

import Foundation

protocol ProtocolToCelsius {
    static func inKelvin(_ kelvin: Double) -> Double
}

extension ProtocolToCelsius {

    static func inKelvin(_ kelvin: Double) -> Double {
        let сelsius = round(kelvin - 273.15)
        return сelsius
    }
}
