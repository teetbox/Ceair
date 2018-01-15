//
//  WidgetViewController.swift
//  Widget
//
//  Created by Tong Tian on 1/13/18.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit
import NotificationCenter

class WidgetViewController: UIViewController, NCWidgetProviding {
   
    @IBOutlet weak var blankLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var tableHeight: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.reloadData()
        tableHeight = tableView.contentSize.height
        
        extensionContext?.widgetLargestAvailableDisplayMode = .expanded
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        completionHandler(NCUpdateResult.newData)
    }
    
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        if activeDisplayMode == .expanded {
            preferredContentSize = CGSize(width: maxSize.width, height: tableHeight)
        } else {
            preferredContentSize = maxSize
        }
    }
    
}

extension WidgetViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "TTSY"
        cell.detailTextLabel?.text = "2018-1-15"
        return cell
    }
    
}
