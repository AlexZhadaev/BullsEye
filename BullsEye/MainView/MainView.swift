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
    
    var slider = UISlider()
    var targetValueLabel = UILabel()
    var scoreValueLabel = UILabel()
    var roundValueLabel = UILabel()
    
    var sliderCurrentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setup() {
        
        let shadowOffset = CGSize(width: 0, height: 1)
        
        backgroundImage.image = UIImage(named: "Background")
        
        headLabel.labelSetup(text: "Put the Bull's Eye as close as you can to:", textColor: .white, font: "arialroundedmtbold", fontSize: 20, shadowColor: .black, shadowOffset: shadowOffset)
        
        targetValueLabel.labelSetup(text: "100", textColor: .white, font: "arialroundedmtbold", fontSize: 20, shadowColor: .black, shadowOffset: shadowOffset)
        
        zeroLabel.labelSetup(text: "0", textColor: .white, font: "arialroundedmtbold", fontSize: 18, shadowColor: .black, shadowOffset: shadowOffset)
        
        hundredLabel.labelSetup(text: "100", textColor: .white, font: "arialroundedmtbold", fontSize: 18, shadowColor: .black, shadowOffset: shadowOffset)
        
        scoreTextLabel.labelSetup(text: "Score:", textColor: .white, font: "arialroundedmtbold", fontSize: 20, shadowColor: .black, shadowOffset: shadowOffset)
        
        scoreValueLabel.labelSetup(text: "", textColor: .white, font: "arialroundedmtbold", fontSize: 20, shadowColor: .black, shadowOffset: shadowOffset)
        
        roundTextLabel.labelSetup(text: "Round:", textColor: .white, font: "arialroundedmtbold", fontSize: 20, shadowColor: .black, shadowOffset: shadowOffset)
        
        roundValueLabel.labelSetup(text: "", textColor: .white, font: "arialroundedmtbold", fontSize: 20, shadowColor: .black, shadowOffset: shadowOffset)
        
        hitMeButton.buttonSetup(image: nil, backgroundImageNormal: "Button-Normal", backgroundImageHighlighted: "Button-Highlighted", title: "Hit Me!", color: #colorLiteral(red: 0.3764705882, green: 0.1176470588, blue: 0, alpha: 1), font: "arialroundedmtbold", fontSize: 20, shadowColor: .black, shadowOffset: shadowOffset, reversesTitle: true, edgeInsets: nil)
        
        aboutButton.buttonSetup(image: "InfoButton", backgroundImageNormal: "SmallButton", backgroundImageHighlighted: nil, title: nil, color: nil, font: nil, fontSize: nil, shadowColor: nil, shadowOffset: nil, reversesTitle: true, edgeInsets: nil)
        
        restartButton.buttonSetup(image: "StartOverIcon", backgroundImageNormal: "SmallButton", backgroundImageHighlighted: nil, title: nil, color: nil, font: nil, fontSize: nil, shadowColor: nil, shadowOffset: nil, reversesTitle: true, edgeInsets: nil)
        
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
        
        backgroundImage.imageViewConstraints(top: self.safeAreaLayoutGuide.topAnchor, leading: self.safeAreaLayoutGuide.leadingAnchor, bottom: self.safeAreaLayoutGuide.bottomAnchor, trailing: self.safeAreaLayoutGuide.trailingAnchor, centerY: nil, centerX: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        
        headLabel.labelConstraints(top: self.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: targetValueLabel.safeAreaLayoutGuide.leadingAnchor, centerY: nil, centerX: self.safeAreaLayoutGuide.centerXAnchor, padding: .init(top: 63.5, left: 0, bottom: 0, right: -10), size: CGSize(width: 0, height: 30))
        
        targetValueLabel.labelConstraints(top: self.safeAreaLayoutGuide.topAnchor, leading: headLabel.safeAreaLayoutGuide.trailingAnchor, bottom: nil, trailing: nil, centerY: nil, centerX: nil, padding: .init(top: 63.5, left: 10, bottom: 0, right: 0), size: CGSize(width: 30, height: 30))
        
        zeroLabel.labelConstraints(top: self.safeAreaLayoutGuide.topAnchor, leading: self.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: nil, centerY: nil, centerX: nil, padding: .init(top: 143.5, left: 85, bottom: 0, right: 0), size: CGSize(width: 12, height: 30))
        
        hundredLabel.labelConstraints(top: self.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: self.safeAreaLayoutGuide.trailingAnchor, centerY: nil, centerX: nil, padding: .init(top: 143.5, left: 0, bottom: 0, right: -80), size: CGSize(width: 35, height: 30))
        
        slider.sliderConstraints(top: self.safeAreaLayoutGuide.topAnchor, leading: zeroLabel.safeAreaLayoutGuide.trailingAnchor, bottom: nil, trailing: hundredLabel.safeAreaLayoutGuide.leadingAnchor, centerY: nil, centerX: self.centerXAnchor, padding: .init(top: 143.5, left: 10, bottom: 0, right: -10), size: CGSize(width: 0, height: 30))
        
        hitMeButton.buttonConstraints(top: slider.safeAreaLayoutGuide.bottomAnchor, leading: nil, bottom: nil, trailing: nil, centerY: nil, centerX: self.safeAreaLayoutGuide.centerXAnchor, padding: .init(top: 40, left: 0, bottom: 0, right: 0))
        
        restartButton.buttonConstraints(top: nil, leading: self.safeAreaLayoutGuide.leadingAnchor, bottom: self.safeAreaLayoutGuide.bottomAnchor, trailing: nil, centerY: nil, centerX: nil, padding: .init(top: 0, left: 80, bottom: -63.5, right: 0), size: CGSize(width: 30, height: 30))
        
        scoreTextLabel.labelConstraints(top: nil, leading: restartButton.safeAreaLayoutGuide.trailingAnchor, bottom: self.safeAreaLayoutGuide.bottomAnchor, trailing: nil, centerY: nil, centerX: nil, padding: .init(top: 0, left: 86, bottom: -63.5, right: 0), size: CGSize(width: 0, height: 30))
        
        scoreValueLabel.labelConstraints(top: nil, leading: scoreTextLabel.trailingAnchor, bottom: self.safeAreaLayoutGuide.bottomAnchor, trailing: nil, centerY: nil, centerX: nil, padding: .init(top: 0, left: 5, bottom: -63.5, right: 0), size: CGSize(width: 0, height: 30))
        
        roundTextLabel.labelConstraints(top: nil, leading: nil, bottom: self.safeAreaLayoutGuide.bottomAnchor, trailing: roundValueLabel.leadingAnchor, centerY: nil, centerX: nil, padding: .init(top: 0, left: 0, bottom: -63.5, right: -5), size: CGSize(width: 0, height: 30))
        
        roundValueLabel.labelConstraints(top: nil, leading: nil, bottom: self.safeAreaLayoutGuide.bottomAnchor, trailing: aboutButton.leadingAnchor, centerY: nil, centerX: nil, padding: .init(top: 0, left: 0, bottom: -63.5, right: -100), size: CGSize(width: 0, height: 30))
        
        aboutButton.buttonConstraints(top: nil, leading: nil, bottom: self.safeAreaLayoutGuide.bottomAnchor, trailing: self.safeAreaLayoutGuide.trailingAnchor, centerY: nil, centerX: nil, padding: .init(top: 0, left: 0, bottom: -63.5, right: -80), size: CGSize(width: 30, height: 30))
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        sliderCurrentValue = 50
        slider.value = Float(sliderCurrentValue)
        round += 1
        UIView.transition(with: targetValueLabel, duration: 0.75, options: .transitionFlipFromBottom, animations: {})
        UIView.transition(with: roundValueLabel, duration: 0.75, options: .transitionFlipFromBottom, animations: {})
        UIView.transition(with: scoreValueLabel, duration: 0.75, options: .transitionFlipFromBottom, animations: {})
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
