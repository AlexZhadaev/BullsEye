//
//  AboutAuthorNewViewController.swift
//  BullsEye
//
//  Created by Жадаев Алексей on 04.11.2020.
//  Copyright © 2020 Жадаев Алексей. All rights reserved.
//

import UIKit

class AboutAuthorNewViewController: UIViewController {
    
    let rootView = AboutAuthorNewView()
    
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
    }
    
    @objc
    private func handleTap() {
        dismiss(animated: true, completion: nil)
    }
}
