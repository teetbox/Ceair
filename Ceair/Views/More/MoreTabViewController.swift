//
//  MoreTabViewController.swift
//  Ceair
//
//  Created by Tong Tian on 10/10/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import UIKit

class MoreTabViewController: UIViewController {
    
    var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "More"
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.fromHEX(string: COLORS.DefaultBackground)
        
        setupSearchBar()
        setupTableView()
    }
    
    let searchView: UIView = {
        let view = UIView()
        return view
    }()
    
    private func setupSearchBar() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.scopeButtonTitles = ["One", "Two", "Three"]
        
        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
            navigationItem.hidesSearchBarWhenScrolling = false
        } else {
            view.addSubview(searchView)
            view.addConstraints(format: "H:|[v0]|", views: searchView)
            view.addConstraints(format: "V:|-64-[v0(44)]", views: searchView)
            
            searchView.addSubview(searchController.searchBar)
        }
    }
    
    let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = UIColor.lightGray
        table.register(TableCell.self, forCellReuseIdentifier: "Cell")
        return table
    }()
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        view.addConstraints(format: "H:|[v0]|", views: tableView)
        view.addConstraints(format: "V:[v0]|", views: tableView)
        
        if #available(iOS 11.0, *) {
            let safeLayoutGuide = view.safeAreaLayoutGuide
            tableView.topAnchor.constraint(equalTo: safeLayoutGuide.topAnchor).isActive = true
        } else {
//            let topLayoutGuide = self.topLayoutGuide
//            view.addConstraints(format: "V:|-\(topLayoutGuide.length)-[v0]", views: tableView)
            tableView.topAnchor.constraint(equalTo: searchView.bottomAnchor).isActive = true
        }
    }
    
}

extension MoreTabViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "TTSY"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController")
        
        navigationController?.pushViewController(detail, animated: true)
    }
}



class TableCell: BaseTVCell {
    
}
