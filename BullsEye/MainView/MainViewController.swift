//
//  MainViewController.swift
//  BullsEye
//
//  Created by Жадаев Алексей on 12.11.2020.
//  Copyright © 2020 Жадаев Алексей. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let rootView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = rootView
        setup()
    }
    
    private func setup() {
        rootView.aboutButton.addTarget(self, action: #selector(aboutViewController), for: .touchUpInside)
        rootView.hitMeButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        rootView.slider.addTarget(self, action: #selector(sliderMoved(_:)), for: .valueChanged)
        rootView.restartButton.addTarget(self, action: #selector(restartGame), for: .touchUpInside)
        restartGame()
    }
    
    
    @objc
    private func aboutViewController() {
        let aboutViewController = AboutNewViewController()
        present(aboutViewController, animated: true)
    }
    
    @objc
    private func showAlert() {
        let difference = abs(rootView.targetValue - rootView.sliderCurrentValue)
        var points = 100 - difference
        
        var title: String
        if difference == 0 {
            title = "Gotcha! 100 bonus points!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                title = "Too close! 50 bonus points!"
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Note even close..."
        }
        
        rootView.score += points
        
        let message = "Your dot is \(rootView.sliderCurrentValue)" + "\nYou scored \(points) points"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.rootView.startNewRound()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @objc
    private func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        rootView.sliderCurrentValue = Int(roundedValue)
    }
    
    @objc
    private func restartGame() {
        rootView.score = 0
        rootView.round = 0
        rootView.startNewRound()
    }
}
