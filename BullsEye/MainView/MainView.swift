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
    
    override func updateConstraints() {
        super.updateConstraints()
        NSLayoutConstraint.activate([
            headLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 151.5),
            headLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -201.5),
            headLabel.topAnchor.constraint(equalTo: topAnchor, constant: 63.5),
            headLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -281.5),
            
            targetValueLabel.topAnchor.constraint(equalTo: topAnchor, constant: 63.5),
            targetValueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -162.5),
            targetValueLabel.bottomAnchor.constraint(equalTo: slider.topAnchor, constant: -47),
            
            slider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            slider.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
        
    }
    
    fileprivate func setup() {
        
        backgroundImage.frame = UIScreen.main.bounds
        backgroundImage.image = UIImage(named: "Background")
        
        hitMeButton.translatesAutoresizingMaskIntoConstraints = false
        hitMeButton.setBackgroundImage(UIImage(named: "Button-Normal"), for: .normal)
        hitMeButton.setBackgroundImage(UIImage(named: "Button-Highlighted"), for: .highlighted)
        hitMeButton.setTitle("Hit Me!", for: .normal)
        hitMeButton.setTitleColor(#colorLiteral(red: 0.3764705882, green: 0.1176470588, blue: 0, alpha: 1), for: .normal)
        hitMeButton.titleLabel?.font = UIFont(name: "arialroundedmtbold", size: 20)
        hitMeButton.setTitleShadowColor(.black, for: .normal)
        hitMeButton.titleLabel?.shadowOffset = CGSize(width: 0, height: 1)
        
        
        addSubview(backgroundImage)
        addSubview(headLabel)
        addSubview(targetValueLabel)
        addSubview(slider)
        setNeedsUpdateConstraints()
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
