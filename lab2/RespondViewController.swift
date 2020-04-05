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
    @IBOutlet weak var copyTextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate = self
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
            return limitedTextField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        }
        return true
    }
}
