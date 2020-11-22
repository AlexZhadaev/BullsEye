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
    
    fileprivate func setup() {
        
        backgroundImage.image = UIImage(named: "Background")
        
        if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html") {
            let url = URL(fileURLWithPath: htmlPath)
            let request = URLRequest(url: url)
            webView.load(request)
        }
        
        closeButton.buttonSetup(image: nil, backgroundImageNormal: "Button-Normal", backgroundImageHighlighted: "Button-Highlighted", title: "Close", color: #colorLiteral(red: 0.3764705882, green: 0.1176470588, blue: 0, alpha: 1), font: "arialroundedmtbold", fontSize: 16, shadowColor: .black, shadowOffset: CGSize(width: 0, height: 1), reversesTitle: true, edgeInsets: nil)
        
        aboutAuthorButton.buttonSetup(image: nil, backgroundImageNormal: "Button-Normal", backgroundImageHighlighted: "Button-Highlighted", title: "About the author", color: #colorLiteral(red: 0.3764705882, green: 0.1176470588, blue: 0, alpha: 1), font: "arialroundedmtbold", fontSize: 16, shadowColor: .black, shadowOffset: CGSize(width: 0, height: 1), reversesTitle: true, edgeInsets: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
        
        addSubview(backgroundImage)
        addSubview(webView)
        addSubview(closeButton)
        addSubview(aboutAuthorButton)
        
        backgroundImage.imageViewConstraints(top: self.safeAreaLayoutGuide.topAnchor, leading: self.safeAreaLayoutGuide.leadingAnchor, bottom: self.safeAreaLayoutGuide.bottomAnchor, trailing: self.safeAreaLayoutGuide.trailingAnchor, centerY: nil, centerX: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        
        webView.webViewConstraints(top: self.safeAreaLayoutGuide.topAnchor, leading: self.safeAreaLayoutGuide.leadingAnchor, bottom: self.safeAreaLayoutGuide.bottomAnchor, trailing: self.safeAreaLayoutGuide.trailingAnchor, centerY: nil, centerX: nil, padding: .init(top: 20, left: 20, bottom: -100, right: -30))
        
        closeButton.buttonConstraints(top: nil, leading: nil, bottom: self.safeAreaLayoutGuide.bottomAnchor, trailing: nil, centerY: nil, centerX: self.safeAreaLayoutGuide.centerXAnchor, padding: .init(top: 0, left: 0, bottom: -30, right: 0))
        
        aboutAuthorButton.buttonConstraints(top: nil, leading: nil, bottom: self.safeAreaLayoutGuide.bottomAnchor, trailing: self.safeAreaLayoutGuide.trailingAnchor, centerY: nil, centerX: nil, padding: .init(top: 0, left: 0, bottom: -30, right: -30))
        
    }
    
}
