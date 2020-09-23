//
//  ViewController.swift
//  BullsEye
//
//  Created by Жадаев Алексей on 21.08.2020.
//  Copyright © 2020 Жадаев Алексей. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showAlert() {
        let alert = UIAlertController(title: "Hello, World", message: "This is my first app!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func knockKnock() {
        let alert = UIAlertController(title: "Knock Knock!", message: "Who are there?", preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "Dead Moroz!", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

