//
//  AboutNewViewController.swift
//  BullsEye
//
//  Created by Жадаев Алексей on 10.11.2020.
//  Copyright © 2020 Жадаев Алексей. All rights reserved.
//

import UIKit

class AboutNewViewController: UIViewController {
    
    let rootView = AboutNewView()
    
    init() {
        super.init(nibName: .none, bundle: .none)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = rootView
    }
    
    private func setup() {
        rootView.closeButton.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        rootView.aboutAuthorButton.addTarget(self, action: #selector(aboutAuthorViewController), for: .touchUpInside)
    }
    
    @objc
    private func handleTap() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc
    private func aboutAuthorViewController() {
        let aboutAuthorViewController = AboutAuthorNewViewController()
        present(aboutAuthorViewController, animated: true)
    }
}
