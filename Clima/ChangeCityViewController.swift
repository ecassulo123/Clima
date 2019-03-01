//
//  ChangeCityViewController.swift
//  WeatherApp
//
//  Created by Angela Yu on 23/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit



protocol ChangeCityDelegate {
    func userEnteredANewCityName(city: String)
func humidityVariable(type: String)
}



class ChangeCityViewController: UIViewController {

    var delegate : ChangeCityDelegate?
    var featureOnorOff = ""
    //linked IBOutlet to text field
    @IBOutlet weak var changeCityTextField: UITextField!

    
    
    
    
    @IBAction func getWeatherPressed(_ sender: AnyObject) {

        let cityName = changeCityTextField.text!
        
        delegate?.userEnteredANewCityName(city: cityName)

        self.dismiss(animated: true, completion: nil)
        
        performSegue(withIdentifier: "humiditySegue", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "humiditySegue" {
            let secondVC = segue.destination as! WeatherViewController
            secondVC.humidityVariable = false
        }
    }
    
    
    @IBAction func humiditySwich(_ sender: UISwitch) {
        if(sender.isOn == true){
        featureOnorOff = "isOn"
       delegate?.humidityVariable(type: featureOnorOff)
           self.dismiss(animated: true, completion: nil)
        
    }else{
    featureOnorOff = "isOff"
    delegate?.humidityVariable(type: featureOnorOff)
    }
    
    }
    @IBAction func backButtonPressed(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

