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
    let zeroLabel = UILabel()
    let hundredLabel = UILabel()
    
    var sliderCurrentValue = 0
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setup() {
        
        let shadowOffset = CGSize(width: 0, height: 1)
        
        backgroundImage.frame = UIScreen.main.bounds
        backgroundImage.image = UIImage(named: "Background")
        
        headLabel.labelSetup(text: "Put the Bull's Eye as close as you can to:", textColor: .white, font: "arialroundedmtbold", fontSize: 16, shadowColor: .black, shadowOffset: shadowOffset)
        
        targetValueLabel.labelSetup(text: "100", textColor: .white, font: "arialroundedmtbold", fontSize: 20, shadowColor: .black, shadowOffset: shadowOffset)
        
        zeroLabel.labelSetup(text: "0", textColor: .white, font: "arialroundedmtbold", fontSize: 16, shadowColor: .black, shadowOffset: shadowOffset)
        
        hundredLabel.labelSetup(text: "100", textColor: .white, font: "arialroundedmtbold", fontSize: 16, shadowColor: .black, shadowOffset: shadowOffset)
        
        scoreTextLabel.labelSetup(text: "Score:", textColor: .white, font: "arialroundedmtbold", fontSize: 16, shadowColor: .black, shadowOffset: shadowOffset)
        
        scoreValueLabel.labelSetup(text: "", textColor: .white, font: "arialroundedmtbold", fontSize: 20, shadowColor: .black, shadowOffset: shadowOffset)
        
        roundTextLabel.labelSetup(text: "Round:", textColor: .white, font: "arialroundedmtbold", fontSize: 16, shadowColor: .black, shadowOffset: shadowOffset)
        
        roundValueLabel.labelSetup(text: "", textColor: .white, font: "arialroundedmtbold", fontSize: 20, shadowColor: .black, shadowOffset: shadowOffset)
        
        hitMeButton.buttonSetup(image: nil, backgroundImageNormal: "Button-Normal", backgroundImageHighlighted: "Button-Highlighted", title: "Hit Me!", color: #colorLiteral(red: 0.3764705882, green: 0.1176470588, blue: 0, alpha: 1), font: "arialroundedmtbold", fontSize: 20, shadowColor: .black, shadowOffset: shadowOffset, edgeInsets: nil)
        
        aboutButton.buttonSetup(image: "InfoButton", backgroundImageNormal: "SmallButton", backgroundImageHighlighted: nil, title: nil, color: nil, font: nil, fontSize: nil, shadowColor: nil, shadowOffset: nil, edgeInsets: nil)
        
        restartButton.buttonSetup(image: "StartOverIcon", backgroundImageNormal: "SmallButton", backgroundImageHighlighted: nil, title: nil, color: nil, font: nil, fontSize: nil, shadowColor: nil, shadowOffset: nil, edgeInsets: nil)
    
        setupSlider()
        
        addSubview(backgroundImage)
        addSubview(headLabel)
        addSubview(targetValueLabel)
        addSubview(zeroLabel)
        addSubview(hundredLabel)
        addSubview(scoreTextLabel)
        addSubview(scoreValueLabel)
        addSubview(roundTextLabel)
        addSubview(roundValueLabel)
        addSubview(slider)
        addSubview(hitMeButton)
        addSubview(restartButton)
        addSubview(aboutButton)
        
        headLabel.labelConstraints(top: self.safeAreaLayoutGuide.topAnchor, leading: self.safeAreaLayoutGuide.leadingAnchor, bottom: self.safeAreaLayoutGuide.bottomAnchor, trailing: self.safeAreaLayoutGuide.trailingAnchor, centerY: nil, centerX: nil, padding: .init(top: 63.5, left: 151.5, bottom: -281.5, right: -201.5))
        
        targetValueLabel.labelConstraints(top: self.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: self.safeAreaLayoutGuide.trailingAnchor, centerY: nil, centerX: nil, padding: .init(top: 63.5, left: 0, bottom: 0, right: -162.5))
        
        zeroLabel.labelConstraints(top: self.safeAreaLayoutGuide.topAnchor, leading: self.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: nil, centerY: nil, centerX: nil, padding: .init(top: 143.5, left: 95.5, bottom: 0, right: 0))
        
        hundredLabel.labelConstraints(top: self.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: self.safeAreaLayoutGuide.trailingAnchor, centerY: nil, centerX: nil, padding: .init(top: 143.5, left: 0, bottom: 0, right: -95.5))
        
        slider.sliderConstraints(top: self.safeAreaLayoutGuide.topAnchor, leading: self.safeAreaLayoutGuide.leadingAnchor, bottom: self.safeAreaLayoutGuide.bottomAnchor, trailing: self.safeAreaLayoutGuide.trailingAnchor, centerY: nil, centerX: nil, padding: .init(top: 143.5, left: 135.5, bottom: -205.5, right: -135.5))
        
        hitMeButton.buttonConstraints(top: self.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: self.safeAreaLayoutGuide.bottomAnchor, trailing: nil, centerY: nil, centerX: self.safeAreaLayoutGuide.centerXAnchor, padding: .init(top: 193.5, left: 0, bottom: -144.5, right: 0))

        restartButton.buttonConstraints(top: nil, leading: self.safeAreaLayoutGuide.leadingAnchor, bottom: self.safeAreaLayoutGuide.bottomAnchor, trailing: nil, centerY: nil, centerX: nil, padding: .init(top: 0, left: 115.5, bottom: -63.5, right: 0))
        
        scoreTextLabel.labelConstraints(top: nil, leading: restartButton.safeAreaLayoutGuide.trailingAnchor, bottom: self.safeAreaLayoutGuide.bottomAnchor, trailing: nil, centerY: nil, centerX: nil, padding: .init(top: 0, left: 56, bottom: -63.5, right: 0))
        
        scoreValueLabel.labelConstraints(top: nil, leading: scoreTextLabel.trailingAnchor, bottom: self.safeAreaLayoutGuide.bottomAnchor, trailing: nil, centerY: nil, centerX: nil, padding: .init(top: 0, left: 5, bottom: -63.5, right: 0))
        
        roundTextLabel.labelConstraints(top: nil, leading: nil, bottom: self.safeAreaLayoutGuide.bottomAnchor, trailing: roundValueLabel.leadingAnchor, centerY: nil, centerX: nil, padding: .init(top: 0, left: 0, bottom: -63.5, right: -5))
        
        roundValueLabel.labelConstraints(top: nil, leading: nil, bottom: self.safeAreaLayoutGuide.bottomAnchor, trailing: aboutButton.leadingAnchor, centerY: nil, centerX: nil, padding: .init(top: 0, left: 0, bottom: -63.5, right: -70))
        
        aboutButton.buttonConstraints(top: nil, leading: nil, bottom: self.safeAreaLayoutGuide.bottomAnchor, trailing: self.safeAreaLayoutGuide.trailingAnchor, centerY: nil, centerX: nil, padding: .init(top: 0, left: 0, bottom: -63.5, right: -115.5))
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        sliderCurrentValue = 50
        slider.value = Float(sliderCurrentValue)
        round += 1
        updateLabels()
    }
    
    fileprivate func updateLabels() {
        targetValueLabel.text = String(targetValue)
        scoreValueLabel.text = String(score)
        roundValueLabel.text = String(round)
    }
    
    fileprivate func setupSlider() {
        
        slider.minimumValue = 0
        
        slider.maximumValue = 100
        
        let roundedValue = slider.value.rounded()
        sliderCurrentValue = Int(roundedValue)

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
