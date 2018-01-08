//
//  DestinationFilterViewModel.swift
//  Ceair
//
//  Created by Matt Tian on 03/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import Foundation

protocol DestinationFilterViewModelCoordinatorDelegate {
    func dismiss()
}

class DestinationFilterViewModel {
    
    var coordinator: DestinationFilterViewModelCoordinatorDelegate?
    
    let dataModel: DestinationFilterDataModelProtocol
    
    var filterNumber: Int {
        return selectedFilter?.count ?? 0
    }
    
    private var filters: [[String]] = [[]]
    
    private var areaFilter: [String]?
    private var dateFilter: [String]?
    private var selectedFilter: [String]?
    
    init(dataModel: DestinationFilterDataModelProtocol) {
        self.dataModel = dataModel
    }
    
    func getFilters(completion: @escaping () -> Void){
        dataModel.getFilters { filters in
            self.filters = filters
            self.selectedFilter = filters.first
            
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func updateFilter(with tag: Int, completion: () -> Void) {
        switch tag {
        case 1:
            selectedFilter = filters.first
        case 2:
            selectedFilter = filters.last
        default:
            fatalError("Unexpected filter tag: \(tag)")
        }
        
        completion()
    }
    
}
