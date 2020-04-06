//
//  GestureViewController.swift
//  lab2
//
//  Created by Marc PEREZ on 6/4/2020.
//  Copyright © 2020 Marc PEREZ. All rights reserved.
//

import UIKit

class GestureViewController: UIViewController {
    
    var direction: UISwipeGestureRecognizer.Direction = .down
    
    @IBOutlet weak var directionLabel: UILabel!
    
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true)
    }
    
    func setDirectionLabel() {
        if (direction == .left) {
            directionLabel.text = "left"
        } else if (direction == .right) {
            directionLabel.text = "right"
        } else if (direction == .up) {
            directionLabel.text = "up"
        } else if (direction == .down) {
            directionLabel.text = "down"
        } else {
            // WTF?
            directionLabel.text = "down"
        }
    }
    
     override func viewDidLoad() {
        super.viewDidLoad()
        setDirectionLabel()
    }

}
