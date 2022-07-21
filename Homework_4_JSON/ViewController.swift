//
//  ViewController.swift
//  Homework_4_JSON
//
//  Created by Александр Борисов on 20.07.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        parsingTextJson()
    }

    func parsingTextJson() {

        guard let data = hwJson.data(using: .utf8) else { return }

        do {
            let decoder = JSONDecoder()

            let model = try decoder.decode(WeatherData.self, from: data)
            print("-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->")
            print(model)

            print("-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->")
            print("\(model.current.temp) градусов по Цельсию")

            print("-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->-->")
            print("ощущается как - \(model.hourly.map { $0.feelsLike }) градусов по Цельсию")

        } catch {
            print(error)
        }
    }


}

