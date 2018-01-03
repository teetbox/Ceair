//
//  DestinationViewController.swift
//  Ceair
//
//  Created by Matt Tian on 03/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

class DestinationViewController: UIViewController {
    
    // TODO: - Using its own viewModel. Do not share with parent's viewModel
    var viewModel: DestinationViewModel!
    
    deinit {
        print("Deinit Destination View Controller")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationItem.title = "Destination"
        navigationController?.isNavigationBarHidden = false
    }
    
}
