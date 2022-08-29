//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate, IWeatherManager {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTF: UITextField!
    
    private var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.delegate = self
        searchTF.delegate = self
    }

    @IBAction func searchButtonTapped(_ sender: UIButton) {
        searchTF.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {  // Кнопка Return на клавиатуре
        searchTF.endEditing(true) // Скрыть клавиатуру по нажатию на кнопку Return
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if searchTF.text != "" {
            return true
        } else {
            searchTF.placeholder = "Введите название города!"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTF.text {
        weatherManager.fetchWeather(by: city)
        }
        searchTF.text = ""
        searchTF.placeholder = "Search"
    }
    
    func didUpdateWeather(weather: WeatherModel) {
        print(weather.temperature)
    }
    
    
}
