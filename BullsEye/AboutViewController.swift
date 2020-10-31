//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Жадаев Алексей on 30.09.2020.
//  Copyright © 2020 Жадаев Алексей. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webViewSetup()
        
    }
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
    
    fileprivate func webViewSetup() {
        if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html") {
            let url = URL(fileURLWithPath: htmlPath)
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}
