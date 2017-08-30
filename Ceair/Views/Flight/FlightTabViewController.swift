//
//  FlightTabViewController.swift
//  Ceair
//
//  Created by Tong Tian on 8/30/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import UIKit

class FlightTabViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = true
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        UIApplication.shared.statusBarStyle = .default
    }
    
    private func setupUI() {
        let backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        let fligtTabBackgroundImage = UIImage(named: Images.FlightBackground)
        backgroundImageView.image = fligtTabBackgroundImage
        
        view.addSubview(backgroundImageView)
    }
    
}
