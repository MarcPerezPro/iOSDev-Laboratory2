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
    
    @IBOutlet weak var sumResult: UILabel!
//    var sumResultPlaceholder: String?
    @IBOutlet weak var subsResult: UILabel!
//    var subsResultPlaceholder: String?
    @IBOutlet weak var multResult: UILabel!
//    var multResultPlaceholder: String?
    @IBOutlet weak var divResult: UILabel!
//    var divResultPlaceholder: String?
    @IBOutlet weak var parityResult: UILabel!
//    var parityResultPlaceholder: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.value1.delegate = self
        self.value1.valueType = .onlyNumbers
        self.value1.maxLength = 6
        self.value2.delegate = self
        self.value2.valueType = .onlyNumbers
        self.value2.maxLength = 6
        
//        sumResultPlaceholder = sumResult.text
//        subsResultPlaceholder = subsResult.text
//        multResultPlaceholder = multResult.text
//        divResultPlaceholder = divResult.text
//        parityResultPlaceholder = parityResult.text
    }
    
//    func resetFields() {
//        sumResult.text = sumResultPlaceholder
//        subsResult.text = subsResultPlaceholder
//        multResult.text = multResultPlaceholder
//        divResult.text = divResultPlaceholder
//        parityResult.text = parityResultPlaceholder
//    }
    
    func sum(left: Int, right: Int) {
        sumResult.text = String(left + right)
    }
    
    func sub(left: Int, right: Int) {
        subsResult.text = String(left - right)
    }

    func mult(left: Int, right: Int) {
        multResult.text = String(left * right)
    }

    func div(left: Int, right: Int) {
        if (right == 0) {
            divResult.text = "ERROR"
        } else {
            divResult.text = String(left / right)
        }
    }

    func parity(left: Int, right: Int) {
        func _parity(number: Int) -> String {
            if (number % 2 == 0) {
                return "yes"
            } else {
                return "no"
            }
        }
        parityResult.text = _parity(number: left) + "," + _parity(number: right)
    }

    func calculate(left: Int, right: Int) {
        sum(left: left, right: right)
        sub(left: left, right: right)
        mult(left: left, right: right)
        div(left: left, right: right)
        parity(left: left, right: right)
    }
    
    func onValuesEntered() {
        func _getIntValue(str: String?) -> Int {
            if (str == nil) {
                return 0
            }
            let value = Int(str!)
            if (value == nil) {
                // WTF ?
                return 0
            } else {
                return value!
            }
        }
        let left = _getIntValue(str: value1.text)
        let right = _getIntValue(str: value2.text)
        calculate(left: left, right: right)
    }

    @IBAction func onValue1Entered(_ sender: LimitedTextField) {
        onValuesEntered()
    }
    @IBAction func onValue2Entered(_ sender: LimitedTextField) {
        onValuesEntered()
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
