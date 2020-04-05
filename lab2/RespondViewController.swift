//
//  RespondViewController.swift
//  lab2
//
//  Created by Marc PEREZ on 5/4/2020.
//  Copyright © 2020 Marc PEREZ. All rights reserved.
//

import UIKit

class RespondViewController: UIViewController {

    @IBOutlet weak var textField: LimitedTextField!
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate = self
        self.textField.valueType = .onlyLetters
    }

    @IBAction func onCopyTextButtonTapped(_ sender: UIButton) {
        label.text = textField.text
    }
}

extension RespondViewController: UITextFieldDelegate {
    
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
