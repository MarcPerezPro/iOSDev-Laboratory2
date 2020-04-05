//
//  CalculatorViewController.swift
//  lab2
//
//  Created by Marc PEREZ on 5/4/2020.
//  Copyright © 2020 Marc PEREZ. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var value1: LimitedTextField!
    @IBOutlet weak var value2: LimitedTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.value1.delegate = self
        self.value1.valueType = .onlyNumbers
        self.value1.maxLength = 4
        self.value2.delegate = self
        self.value2.valueType = .onlyNumbers
        self.value2.maxLength = 4
    }


}

extension CalculatorViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        // Verify all the conditions
        if let limitedTextField = textField as? LimitedTextField {
            let value = limitedTextField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
            if value == false {
                // Play the shake animation
                limitedTextField.shake()
            }
            return value
        }
        return true
    }
}
