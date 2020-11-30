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
    
    private func setup() {
        
        backgroundImage.image = UIImage(named: "Background")
        
        info.isUserInteractionEnabled = false
        info.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor."
        info.backgroundColor = .clear
        info.textColor = .white
        info.font = UIFont(name: "arialroundedmtbold", size: 16)
        
        name.isUserInteractionEnabled = false
        name.text = "Alex Zhadaev"
        name.textColor = .white
        name.font = UIFont(name: "arialroundedmtbold", size: 16)
        
        authorImage.isUserInteractionEnabled = false
        authorImage.image = UIImage(named: "authorphoto")
        
        closeButton.buttonSetup(image: nil, backgroundImageNormal: "Button-Normal", backgroundImageHighlighted: "Button-Highlighted", title: "Back", color: #colorLiteral(red: 0.3764705882, green: 0.1176470588, blue: 0, alpha: 1), font: "arialroundedmtbold", fontSize: 16, shadowColor: .black, shadowOffset: CGSize(width: 0, height: 1), reversesTitle: true, edgeInsets: nil)
        
        addSubview(backgroundImage)
        addSubview(info)
        addSubview(name)
        addSubview(authorImage)
        addSubview(closeButton)
        
        backgroundImage.imageViewConstraints(top: self.safeAreaLayoutGuide.topAnchor, leading: self.safeAreaLayoutGuide.leadingAnchor, bottom: self.safeAreaLayoutGuide.bottomAnchor, trailing: self.safeAreaLayoutGuide.trailingAnchor, centerY: nil, centerX: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        
        info.textViewConstraints(top: self.safeAreaLayoutGuide.topAnchor, leading: self.safeAreaLayoutGuide.leadingAnchor, bottom: self.safeAreaLayoutGuide.bottomAnchor, trailing: authorImage.safeAreaLayoutGuide.leadingAnchor, centerY: nil, centerX: nil, padding: .init(top: 45.5, left: 85.5, bottom: -130.5, right: -15))
        
        name.textFieldConstraints(top: authorImage.safeAreaLayoutGuide.bottomAnchor, leading: nil, bottom: nil, trailing: self.safeAreaLayoutGuide.trailingAnchor, centerY: nil, centerX: nil, padding: .init(top: 10, left: 0, bottom: 0, right: -105), size: CGSize(width: 135, height: 30))
        
        authorImage.imageViewConstraints(top: self.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: self.safeAreaLayoutGuide.trailingAnchor, centerY: nil, centerX: nil, padding: .init(top: 55, left: 0, bottom: 0, right: -85.5), size: CGSize(width: 200, height: 160))
        
        closeButton.buttonConstraints(top: nil, leading: nil, bottom: self.safeAreaLayoutGuide.bottomAnchor, trailing: nil, centerY: nil, centerX: self.safeAreaLayoutGuide.centerXAnchor, padding: .init(top: 0, left: 0, bottom: -45.5, right: 0))
        
    }
}
