//
//  ConversorViewController.swift
//  lab2
//
//  Created by Marc PEREZ on 5/4/2020.
//  Copyright © 2020 Marc PEREZ. All rights reserved.
//

import UIKit

class ConversorViewController: UIViewController {

    @IBOutlet weak var celsiusInput: LimitedTextField!
    @IBOutlet weak var fahrenheitOutput: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.celsiusInput.delegate = self
        self.celsiusInput.allowedCharInString = ".0123456789"
    }

    /// MeasurementFormatter sucks, so I need a workarroud
    func formatCelsiusToFahrenheit(_ celsius: Measurement<UnitTemperature>) -> String {
        let fahrenheiht = celsius.converted(to: UnitTemperature.fahrenheit)
        let measurementFormatter = MeasurementFormatter()
        measurementFormatter.unitOptions = .providedUnit // Override locale
        measurementFormatter.numberFormatter.maximumFractionDigits = 2 // precision should be 2
        measurementFormatter.unitStyle = .short // I can't remove the unit, so let's make it one character
        let formattedStringWithUnit = measurementFormatter.string(from: fahrenheiht)
        return String(formattedStringWithUnit.dropLast()) // Drop the degree at the end
    }
    
    @IBAction func onCelsiusEntered(_ sender: LimitedTextField) {
        let placeholder = "???"
        if celsiusInput.text == nil {
            fahrenheitOutput.text = placeholder
            return
        }
        let number = Double(celsiusInput.text!)
        if number == nil {
            fahrenheitOutput.text = placeholder
            return
        }
        let celsius = Measurement(value: number!, unit: UnitTemperature.celsius)
        fahrenheitOutput.text = formatCelsiusToFahrenheit(celsius)
    }

}

extension ConversorViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        // Verify all the conditions
        if let limitedTextField = textField as? LimitedTextField {
            return limitedTextField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        return true
    }
}
