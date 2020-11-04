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
    let authorImage = UIImage()
    let closeButton = UIButton()
    
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
        
            info.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            info.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -432),
            info.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            info.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -205)
        ])
        
    }
    
    fileprivate func setup() {
        backgroundColor = .white
        info.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor."
        info.translatesAutoresizingMaskIntoConstraints = false
        info.isUserInteractionEnabled = false
        name.frame = CGRect(x: 315, y: 185, width: 133, height: 34)
        name.text = "Alex Zhadaev"
        addSubview(info)
        addSubview(name)
        setNeedsUpdateConstraints()
    }
    
}
