//
//  MainView.swift
//  BullsEye
//
//  Created by Жадаев Алексей on 12.11.2020.
//  Copyright © 2020 Жадаев Алексей. All rights reserved.
//

import UIKit

class MainView: UIView {

    let backgroundImage = UIImageView()
    let hitMeButton = UIButton()
    let aboutButton = UIButton()
    let restartButton = UIButton()
    let headLabel = UILabel()
    let scoreTextLabel = UILabel()
    let roundTextLabel = UILabel()
    
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    var slider = UISlider()
    var targetValueLabel = UILabel()
    var scoreValueLabel = UILabel()
    var roundValueLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupSlider()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setup() {
        
        backgroundImage.frame = UIScreen.main.bounds
        backgroundImage.image = UIImage(named: "Background")
        
        hitMeButton.buttonSetup(backgroundImageNormal: "Button-Normal", backgroundImageHighlighted: "Button-Highlighted", title: "Hit Me!", color: #colorLiteral(red: 0.3764705882, green: 0.1176470588, blue: 0, alpha: 1), font: "arialroundedmtbold", fontSize: 20, shadowColor: .black, shadowOffset: CGSize(width: 0, height: 1), edgeInsets: nil)
        
        addSubview(backgroundImage)
        addSubview(headLabel)
        addSubview(targetValueLabel)
        addSubview(slider)
        addSubview(hitMeButton)
        
        headLabel.labelConstraints(top: self.safeAreaLayoutGuide.topAnchor, leading: self.safeAreaLayoutGuide.leadingAnchor, bottom: self.safeAreaLayoutGuide.bottomAnchor, trailing: self.safeAreaLayoutGuide.trailingAnchor, centerY: nil, centerX: nil, padding: .init(top: 63.5, left: 151.5, bottom: -281.5, right: -201.5))
        
        targetValueLabel.labelConstraints(top: self.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: self.safeAreaLayoutGuide.trailingAnchor, centerY: nil, centerX: nil, padding: .init(top: 63.5, left: 0, bottom: -30, right: -162.5))
        
        slider.sliderConstraints(top: self.safeAreaLayoutGuide.topAnchor, leading: self.safeAreaLayoutGuide.leadingAnchor, bottom: self.safeAreaLayoutGuide.bottomAnchor, trailing: self.safeAreaLayoutGuide.trailingAnchor, centerY: nil, centerX: nil, padding: .init(top: 143.5, left: 135.5, bottom: -205.5, right: -135.5))
        
        hitMeButton.buttonConstraints(top: self.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: self.safeAreaLayoutGuide.bottomAnchor, trailing: nil, centerY: nil, centerX: self.safeAreaLayoutGuide.centerXAnchor, padding: .init(top: 193.5, left: 0, bottom: -144.5, right: 0))

    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        round += 1
        updateLabels()
    }
    
    fileprivate func updateLabels() {
        targetValueLabel.text = String(targetValue)
        scoreValueLabel.text = String(score)
        roundValueLabel.text = String(round)
    }
    
    fileprivate func setupSlider() {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }
}
