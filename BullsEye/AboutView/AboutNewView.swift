//
//  AboutNewView.swift
//  BullsEye
//
//  Created by Жадаев Алексей on 10.11.2020.
//  Copyright © 2020 Жадаев Алексей. All rights reserved.
//

import UIKit
import WebKit

class AboutNewView: UIView {

    let backgroundImage = UIImageView()
    let webView = WKWebView()
    let closeButton = UIButton()
    let aboutAuthorButton = UIButton()
    
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
            webView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            webView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            webView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            webView.bottomAnchor.constraint(equalTo: closeButton.topAnchor, constant: -20),
            
            closeButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            closeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
            aboutAuthorButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            aboutAuthorButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
        
    }
    
    fileprivate func setup() {
        
        backgroundImage.frame = UIScreen.main.bounds
        backgroundImage.image = UIImage(named: "Background")
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html") {
            let url = URL(fileURLWithPath: htmlPath)
            let request = URLRequest(url: url)
            webView.load(request)
        }
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setBackgroundImage(UIImage(named: "Button-Normal"), for: .normal)
        closeButton.setBackgroundImage(UIImage(named: "Button-Highlighted"), for: .highlighted)
        closeButton.setTitle("Close", for: .normal)
        closeButton.setTitleColor(#colorLiteral(red: 0.3764705882, green: 0.1176470588, blue: 0, alpha: 1), for: .normal)
        closeButton.titleLabel?.font = UIFont(name: "arialroundedmtbold", size: 16)
        closeButton.setTitleShadowColor(.black, for: .normal)
        closeButton.titleLabel?.shadowOffset = CGSize(width: 0, height: 1)
        
        aboutAuthorButton.translatesAutoresizingMaskIntoConstraints = false
        aboutAuthorButton.setBackgroundImage(UIImage(named: "Button-Normal"), for: .normal)
        aboutAuthorButton.setBackgroundImage(UIImage(named: "Button-Highlighted"), for: .highlighted)
        aboutAuthorButton.setTitle("About the author", for: .normal)
        aboutAuthorButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        aboutAuthorButton.setTitleColor(#colorLiteral(red: 0.3764705882, green: 0.1176470588, blue: 0, alpha: 1), for: .normal)
        aboutAuthorButton.titleLabel?.font = UIFont(name: "arialroundedmtbold", size: 16)
        aboutAuthorButton.setTitleShadowColor(.black, for: .normal)
        aboutAuthorButton.titleLabel?.shadowOffset = CGSize(width: 0, height: 1)
        
        addSubview(backgroundImage)
        addSubview(webView)
        addSubview(closeButton)
        addSubview(aboutAuthorButton)
        setNeedsUpdateConstraints()
    }
    
}
