//
//  AboutAuthorNewView.swift
//  BullsEye
//
//  Created by Жадаев Алексей on 04.11.2020.
//  Copyright © 2020 Жадаев Алексей. All rights reserved.
//

import UIKit

class AboutAuthorNewView: UIView {
    
    let info = UITextView()
    let name = UITextField()
    let authorImage = UIImageView()
    let closeButton = UIButton()
    let backgroundImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        NSLayoutConstraint.activate([
            
            info.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 104.5),
            info.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -316.5),
            info.topAnchor.constraint(equalTo: topAnchor, constant: 44.5),
            info.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -130.5),
            
            name.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 399.5),
            name.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -134.5),
            name.topAnchor.constraint(equalTo: topAnchor, constant: 210.5),
            name.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -130.5),
            
            authorImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 368.5),
            authorImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -104.5),
            authorImage.topAnchor.constraint(equalTo: topAnchor, constant: 45.5),
            authorImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -179.5)
        ])
        
    }
    
    fileprivate func setup() {
        
        backgroundImage.frame = UIScreen.main.bounds
        backgroundImage.image = UIImage(named: "Background")
        
        info.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor."
        info.translatesAutoresizingMaskIntoConstraints = false
        info.isUserInteractionEnabled = false
        info.backgroundColor = .clear
        info.textColor = .white
        info.font = UIFont(name: "Arial Rounded MT Bold", size: 16)
        
        name.text = "Alex Zhadaev"
        name.translatesAutoresizingMaskIntoConstraints = false
        name.isUserInteractionEnabled = false
        name.textColor = .white
        name.font = UIFont(name: "Arial Rounded MT Bold", size: 16)
        
        authorImage.image = UIImage(named: "authorphoto")
        authorImage.translatesAutoresizingMaskIntoConstraints = false
        authorImage.isUserInteractionEnabled = false
        
        addSubview(backgroundImage)
        addSubview(info)
        addSubview(name)
        addSubview(authorImage)
        setNeedsUpdateConstraints()
    }
    
}
